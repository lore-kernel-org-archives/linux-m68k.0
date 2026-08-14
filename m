Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B996E33BBAF
	for <linux-m68k@vger.kernel.org>; Fri, 14 Aug 2026 03:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786677477; cv=none; b=fb6Jlk1BTScCOoQu4Jp/vSp7wyheRv2CqQ7T13ESR0jURMZ7PRpYqawGYtLn5Z3pYATPA4wiYbjEXqVcMNCLwmKVQZOz/iqR2y+HNIPSBlZ7ISDB6Hv2RvRRVkiccgFT6TsiFdePjGFV9s7CMnOabhW+QqEatRonPspFBl+THDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786677477; c=relaxed/simple;
	bh=9iXUcEAZScHbA2IuW77Jv02JvlGJL3bgXZI38BwUag8=;
	h=From:To:Cc:Subject:Date:Message-Id; b=h2ExI8RBTa+FvPhzCYV3y1UMkO51Ydqci9kFbGkuVZARE9DHcWxK2Ny62giWKIt9Sq1C25OHC4veCRZs9BlnS56gmFVFKa6AYer7Y/easU8Ceo361qRFtgT0kvqy1Q1DFUyXl9SDv8CsUqWL54/9G61D5vSYFFXTKOwQLuUKxlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjTXolWD; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjTXolWD"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d049069377so6742445ad.0
        for <linux-m68k@vger.kernel.org>; Thu, 13 Aug 2026 20:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786677475; x=1787282275; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uK6bOauHfECfDNa58kGZVg7dshleXMgRZDu8Rgs+log=;
        b=BjTXolWD7kKh6xOxkA9cCbEzChYUCcB1p+UQ61UllsHZplbHhfr0imyMWS8m/PAZS3
         E4u/0HyldHPUlayofMhxLVasdz5dCuwBJ2JbMozqBr4VZXVCjf9TTjNWdxHP6dSRGLUc
         sHKzaP+fL8P3u25xhcypt4M7+LAxeLfQ5+9hpVq9xou3dsyxf0fBxn+ILum2JjFup/ok
         wLeXnQtwwLEh5mnsWG0DPB8H41bOZd/EopkZVUjpZYaXDuTSLIPO6H4DfsBtGoD+qRJf
         MtBTcb76JP24fAL9PykaQPMfOt8xVHTuqA5znPY8PhoWPKS0GeDbAet3LgjqNz94mDUi
         TtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786677475; x=1787282275;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uK6bOauHfECfDNa58kGZVg7dshleXMgRZDu8Rgs+log=;
        b=OUBXHRSsHJ8XkAIDB0+MP2UcqawTQAdPf9s5xRh133mR4nLRUJvhBMFxfYk8QkD4HA
         lKavRu/SDoXTGt7jd9lH5gDTvAhuPUJpPrq7hhAiQL51Gk9mc5S7fuOeNCgAorrpprnl
         VdvuKWJfQKPkt+TrCfVuVLfjbytBCFAbZFrBEY13Ns2ishrfshQyv9F5Agf/nnRFPQen
         JHboCjeqwV6he6pnXegjPQLKj15h+UhuS23ZZIpeHj90FLs2EUD1zqIZrVoMdMwnt/Z/
         ghVwvZnNqPC2KmCJlnrfCKKFMbnBAgfgqvNJgLuXqTRVHdd3xAqOmGS+u5mF9TjcGI6r
         lN4Q==
X-Gm-Message-State: AOJu0Yx5mCQTA/X6MfRLwyefFz5anb2LE06CUlnS4p32yXRMrMTEroip
	6BbsUCsyZn4Wir9sIgTN9KhfA1rnHrRUd8YN3T59/2dAH3b0mPsoB4aB
X-Gm-Gg: AR+sD12fkD1vIvL6SVa1+T1NGuNXDxFDCNtRpyAi5Cb/i607eSodwbGRq3sCzBe0j/4
	r40HIa+q3qz5pXgn0KFFx4iBU8sQVYU2KSaQ4/svOiCdXTQNcmurIHVSeN+z9DVRuWUZ88LzFl4
	8Q9w8cAB6zc8mlsIxQ0TuNpsmynR1pY2GpJIbCg+Jqh7hgMTA72azfAp56BkEfNBKYeSNEKA5Tz
	k/VCuTcHc4qLEf8L37L2hRy3Ze/JsJwuyKou4yYXyRbHeSzVcDiN5gCPONivJCdqkttE8hX5x/F
	FGQ8M9KqEejZ8MCnfW5MeL5OnAI+e8A3dXPfInTK6DUuZM5nX8Wdspuyo5dlBVXMdzFyaYHHcIY
	yDv0hMJyC3RcfCrUSY4xzczxMce5HYnOREC1pNNIu07nyRgMR18RjfGzAN9FY50z2EHEVJILVLY
	XgTMm/DK9bMFhqkMZyuKiJRe7kO9JlZReZyg1Q9Ilx5CgLvGNkhg2dIcp0esfLlIyF+Ej1XrTJh
	O3tY4CC4XtYtdBtw7Lz5oFbUb4RjL+ccUqrdPX/X8b+qP0q1azfTQ==
X-Received: by 2002:a17:90b:3c91:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-3933b78e3c2mr3101134a91.7.1786677474836;
        Thu, 13 Aug 2026 20:17:54 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-170-159-fibre.sparkbb.co.nz. [222.152.170.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc39de5sm12797261eec.22.2026.08.13.20.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 20:17:54 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 08D5E360325; Fri, 14 Aug 2026 15:17:49 +1200 (NZST)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org,
	geert@linux-m68k.org
Cc: schmitzmic@gmail.com
Subject: [PATCH 0/5] m68k SuperVidel patches
Date: Fri, 14 Aug 2026 15:17:40 +1200
Message-Id: <20260814031745.17140-1-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

Miro Kropacek's patches for Atari SuperVidel, as posted to debian-68k.

Patch 1 is a bugfix for the Atari mouse input device driver
(miscompiled since v6.2 with use of -funsigned_char). 

Patches 2-4 are fbdev hardware support patches for the SuperVidel
blitter hardware.

Patch 5 is adding support to make use of the ethoc hardware also
in the SuperVidel.

All patches tested by Miro on his CT60 with SuperVidel.

Cheers,

   Michael


