Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0054539E162
	for <linux-m68k@vger.kernel.org>; Sun, 16 Aug 2026 07:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786865882; cv=none; b=G7eNOjX2TnYYtVm9y2sCIlrY4o6zUXNjVqbt+TM175G03xWFMC2lj8B9uMBVgf+dr6R2g7RAHQWk6uVedB7yEpG32/ilvtyIujPQDRwslOvmJy93w755VVycZZy4+z/DoO8w3LwGq9Y0AAzsEcoMNNnWqMUIdSZhr26MYKRob9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786865882; c=relaxed/simple;
	bh=gLDYztuLzSDRkD2z2CvD2tMcWvPSrsBRvUyd30wHIMU=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Bq97umTEKAu8x3nmWJ7eIhgbLNhVu8du8U08TlxHDNAIOvddS+jjrnoHkr3RhrtG/JEVZOUbEKb5Gf7422MJ7QkdGB0jkOw9+EsCuGucBiOCZneXbZcv6QZe4RmjMY7OgKXvdlLeWZMZE1bk5lKBa3tiejf1Hr75E/RUnxBMRos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LN1PMbrb; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LN1PMbrb"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso2938483a91.2
        for <linux-m68k@vger.kernel.org>; Sun, 16 Aug 2026 00:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786865880; x=1787470680; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTnPSH4iBdFRk5+pZqCmqJ12kGb9JTWkcky7DaADClI=;
        b=LN1PMbrbYa3kZCV25RbqlihCUy2gT2s/1RSXKjwTACTiL63rsjBSSUBBEFve/OTr1C
         Tige786q1I+RDjdO5wIx+tdYYZguwdffDqyV50ZQj/dH64HpYb073n8YM8DreW6XIGlh
         s16HhozYhtrypx6DsRJlojQDYW4rZW26s/g9r6npzEid9sQtFtE3YC0nWzRDS9efOnrS
         +5UMYCGFLk4YXdhJqouWLdzUutCKGeJ2mK7fVf1sIQbHb/emh+0ZieU4ZAz1CzBLMU4/
         Ae7n2enL5gm994sHmEM48YVxUJStRjXsFgWwVY3MnHJMfYHN80ywyETtuVR6hVhrCEGs
         gE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786865880; x=1787470680;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BTnPSH4iBdFRk5+pZqCmqJ12kGb9JTWkcky7DaADClI=;
        b=k0DLPQAJws5fkcz/WSAiunUkt7DSdWhQgGszC2zv9V1w/P3YrEayIVEeSg41ZOiPwX
         ql1N9ZuZ/WzWLcpl33dRSeht2VK2fpix096cKJ/5AXj4KcSBV3tVlCaBmZ4gpR/OK3z/
         u23ElaxD2FdXdt7ecxgvpxAImJSqP4OcwFIaFm1qS0/6fa/X+nhmgu5hadBOkaqxx37C
         wm07BXAFVTSpcweHtqPy4kNpcWhqxDKxtNeBeH1uYLQa7cKK+OgjsHoU2huOQyGdct/j
         Iecqe4Ny9zwEadE3yHwjirVgiABCxFBilw2XXX73+Bz77ljY5bb1dn5EzmJAbXWDZ7ZW
         VCnQ==
X-Gm-Message-State: AOJu0Yyy5Eb/JwizgywMNT+94GduihHrYCqeQNzLEOtP2WHI52aAzMrc
	yhSlKqawSejxwrGjeRUTVJtPNuaMKF9VB6B6RjhmjCaYKX28FzILSuym
X-Gm-Gg: AR+sD13j6mPpYJKfSOlY0UFamKEm3IxGXdjjHgjnuJEP9UDi3u6taD34Cq2FFE6IuO9
	qoJfS1t0wGaxXHmM9FRUiZ2NHq5ZBqxgPzZwXb8mySinx/ItTRx5Sr32pXZI8HkL747/3aJKPHD
	hRVIws8cl5gRDlY+ygtKRTzndwd4N/yBIOgNVUf5Uvoy9rO4P0jIgYVt/dgbfi0WhS/X7t18Y3w
	N1aJbymjrdgKEVuN8US5weBaW7TDcBvIs32bPpL4Mgv6jfmpOgj40FTBH/Vr8TaDRFV+z1oML2X
	iXj981wUNZMOwFKkYVbSc7jK/tOYfkSiVGe49DZIZmWEjhVQsY4DT3SI7Faodao6OWH29tU7jtU
	7FerXCJN4G++Q8k4TrICVHJG0WCIpqgX62DF2qpUb8NC/StrrqmGUcaO6XuSFGcV6gmtSE/1uZu
	Qn2CG34DpUe7vtlsXVK8A1ocmT8TOHb8lLZyuLZGrMyLH72xVnJBw6OP8JuImqBYpVsuIAkjwXU
	ugTmBrPG4uyqUhh0iq1l+UmNHviXt73N0mFVxr9VGJbfjVmFVDx4g==
X-Received: by 2002:a17:90b:48c1:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-3933b792c20mr20724018a91.9.1786865880245;
        Sun, 16 Aug 2026 00:38:00 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-170-159-fibre.sparkbb.co.nz. [222.152.170.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531e31b8fsm851773a91.3.2026.08.16.00.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 00:37:59 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 7C75D360203; Sun, 16 Aug 2026 19:37:55 +1200 (NZST)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org,
	geert@linux-m68k.org
Cc: schmitzmic@gmail.com
Subject: [PATCH v2 0/5] m68k SuperVidel patches
Date: Sun, 16 Aug 2026 19:37:47 +1200
Message-Id: <20260816073752.16656-1-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

Version 2 of Miro Kropacek's patches for Atari SuperVidel, as
posted to debian-68k.

Patch 1 is a bugfix for the Atari mouse input device driver
(miscompiled since v6.2 with use of -funsigned_char). Geert's
suggestion to change the mouse interrupt function signature
adopted (generates equivalent code as seen by inspection and
testing on my 030 Falcon).

Patches 2-4 are fbdev hardware support patches for the SuperVidel
blitter hardware.

Patch 5 is adding support to make use of the ethoc hardware also
in the SuperVidel. Platform device register error handling (reported
by Geert) fixed.

All patches tested by Miro on his CT60 with SuperVidel.

Cheers,

   Michael


