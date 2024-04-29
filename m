Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3B17490
	for <linux-m68k@vger.kernel.org>; Mon, 29 Apr 2024 03:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714360193; cv=none; b=czgNs1XtkN9uyArdcqJj7Jgh2qX0aAE7FRdubz5XV/Tzgq7JSjScl6dpk885poPgrJfgaI5Ou4nRAD0a6/K1h8+qx2Av5G5DINAYb/yD+IGnw/9skTJb8jjB8uur3gHcs9ueJBQa1DKwAW4Jtmv8S0ZUwaAtEp7lw/Qwsx0Yi9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714360193; c=relaxed/simple;
	bh=KvONKiWc4/aAAPBxTTFSr+gEYjPAfrIDyRdC6nQv3MY=;
	h=From:To:Cc:Subject:Date:Message-Id; b=kd2QPfNdnhhaQ6UXa/GVGN68jX7Cpc2bQ5RzOvK3BlBoNxxQ9362oEgMTXizzeAx0kMa9OCHg+2tywYDzkNqqInVHPkbYpncCVi4DMlWn0beO3oKey8t6yNFWH3ceNJo99gqYvCRQ2Sbe5AU7oQ8QGWJJRkgY9Vqd6Y69sOuls4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZB2QBFr; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZB2QBFr"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5ce2aada130so2714029a12.1
        for <linux-m68k@vger.kernel.org>; Sun, 28 Apr 2024 20:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714360192; x=1714964992; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QgEdsB50CEMPvKYMLer1RUQs1kbrfm0pa1T5hxvpEY=;
        b=OZB2QBFr6u3m2U9lhPB4x5fCt8ZeP0zW3uBHalx6ccjyYutEZqocSVG9Tnlp6OKyFK
         dW9c0VF7n9FRYHQQE2nDZJv3ut+EVvUz+5GB93M7O87RfYWvYAZVYgzOkE1mob4Hc5nE
         eBPKi4DB+lS30dFxH+cbV9uKNItUmOS0gNKIqV/3tJg7zcoSy6giw9g1sbo62o69+sex
         hNzKx8EGhgWa9MPRF7uS++0TL868act/NvbpPtLtjQ1orceWSSlxDtyYZkkrgVL+cRna
         QPx+iVdcU1DjcYcVhnebop2ZDV1uIcBUNcDi6scgx48/a3izsmiK4P5uWXgIwPfCEUlE
         69Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714360192; x=1714964992;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6QgEdsB50CEMPvKYMLer1RUQs1kbrfm0pa1T5hxvpEY=;
        b=qO//xGXGRqn8LHqfadHeEaG5Z7NH3hl/XP82Hd1DefSmolrzcw+oFoq1ov4bdVtqSd
         6zuOsmWdu5GwTxmtLlfYpw7oao97bXDuzOdGETBUT/4+NK1S8W+QJaaVQbdZLyvusQAJ
         7wvFCMsxQDAiIwQja05o0hzLSRkVyLjXVB36cKVL6uSZtll1NKR/zF2xcdN26PFOsXUI
         p8q4jGsJChb1JhvIunIjtQsEL30nme80oAcGAEY5lE9BarvsXzH22dorirAGvjqepAJS
         1jJIUhBOsDdUCp+cMA7B8jg8fLsYx/m12RNV2zVvGfSXKIG4YD7+fjhlilqhZjmBWPov
         J8Yg==
X-Gm-Message-State: AOJu0YwMdvPwb9G7D0Ni5LEWn2qjRmgaQjQWcikV+GVO0sVZ7XZTer/T
	3lv1wgToKZ9TH/kkPa132HYfIZ1tCioCJHm5jllkt0brrcjy3HmX0XPQhw==
X-Google-Smtp-Source: AGHT+IF0n3rLlXC68HKcfTtiNZd50m0CKJpd62JVr9a6Oic33TI2HZGN60OformGy6dijuHhZ1TZgQ==
X-Received: by 2002:a05:6a21:85:b0:1ad:746:3f61 with SMTP id iw5-20020a056a21008500b001ad07463f61mr4317464pzc.28.1714360191868;
        Sun, 28 Apr 2024 20:09:51 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id gu27-20020a056a004e5b00b006ee25097c2csm15686825pfb.103.2024.04.28.20.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 20:09:51 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 8AEF6360314; Mon, 29 Apr 2024 15:09:47 +1200 (NZST)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org,
	geert@linux-m68k.org
Cc: gerg@linux-m68k.org
Subject: [PATCH v4 0/2] m68k uaccess fault handling fixes
Date: Mon, 29 Apr 2024 15:09:43 +1200
Message-Id: <20240429030945.22451-1-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

(Actually now) version 4 of fixes for uaccess fault handling
on 68030, tested on 68030 and 68040.

Patch 1 has one exception table entry fixed (residual
calculated in __generic_copy_to_user did not take into
account the number of longword transfers omitted due to a
fault) si as well as a final NOP added in __clear_user.

Patch 2 is unchanged from v3 (actually since RFC v1), now
has Tested-by tag by Finn Thain added.

These patches would still benefit from testing on 68060
and Coldfire. 

Cheers,

   Michael


