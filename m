Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699A144C65C
	for <linux-m68k@vger.kernel.org>; Mon,  7 Sep 2026 11:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781169; cv=pass; b=cshXd6t9ELK9auH0bFp0F4CFhIOCQf2Vivmv/2XKwQ2nsiNoAMvzB0Y8A6i6w9YBh7Q4LYtiIgpviNEFg2hypKAA9cWnCzdYMD6BiJgpt+SPnLucBMDRSpMN5r8/OdA/kNWdF8Fa/JoucuXZUtOZK7vEqzxueDlkGbjW7euVgTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781169; c=relaxed/simple;
	bh=SSLE1OamutVwjBeXcbye/sSgz5m8gUlm7JyB9t3AKqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lw+P9EJ7C+TVA32VByGPo40ZA/eLbY7wZP/C4C+o+VQ83oV5HKOXtK4jTL06dlit3DccM045rM098N1dodLcxvmMP6hv9BrcwH9l1Z1MiQdno1Z3vw0oUWZUITgu3ZmfvaWm2R4APNySVd77B5kNPR7eCRehmVa0XZbg1CV8vhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pSFRquYQ; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pSFRquYQ"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66bd7857841so3001164d50.3
        for <linux-m68k@vger.kernel.org>; Mon, 07 Sep 2026 04:39:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788781167; cv=none;
        d=google.com; s=arc-20260327;
        b=GJ+ptU5bb5dGskEEhPD+izkb3CdXxOU/s6Otf0TNCb/umkBrKqh53P6SNhvx79+Kub
         9K3e4vs3Nu9ZBpfHjCXrOn4NA2DIe3hNfpOGwco8IIg4KKSmC8eMDt96hpk84PEcjrVx
         rRgPl3BdGqwX14iZ1mMurNTkhCRTqCycqrpJlob48uAP1dqalXTQTbJ0bRdiCPuyw0sQ
         hszocSN47x4ewpRqxXUPpZMwtI42HEKwzhwDjIx0gRwEmxW664b56sPC2kDMxUEtS4ec
         2Foy8VpmJXL/XB4hEM7bDfehP3bHPxnxvsJFqtlgOIdW9eJf66JYlBSV56HKTVBcqmW0
         tMFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gvn/5UwHYBqPMMFPFmFGu9hDeKbnn2ym8sNSpP3zJ9Y=;
        fh=ZuP8xU52zD7vNMf9RI7xM+oa0tGYpErJgAnukUvi5qI=;
        b=RwMP4G4BVvrymTBUZqLHLLIj65WbkcQowZ2KSfW5l5SE71tP+y8hSAJQiHPjoIm7GY
         ey0pE4l3zbxcV/NjwEe54479lgqlpfamq3oV3bvWMwmjUlKADBir4V2GMxlhOwgJXjXg
         lGCDm8e9f1UlNe3WncTBwwVxxzc3NJQzZf3pAHbSpJj8LUXR/Vxt6ivx9zzugJ9dBtf2
         pTnrtLb1TIL6M3pqDgtZzde+hs4SySbsfwozgmMr1hQTf0cI2m3taMrh7M9yrRQ2T4Oc
         JYUEltFPYzyUiBI0nI1bV9AhGmHhD53uOgt6QHuilKX190392Q+mIT9cWikm0PvnQhIe
         3gyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781167; x=1789385967; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gvn/5UwHYBqPMMFPFmFGu9hDeKbnn2ym8sNSpP3zJ9Y=;
        b=pSFRquYQvOZDio31cXwAA8m1hVgyp0rUZEO7on4AZqgKwDPENkN5rzADmM7T6e0G1f
         viDvHJBcaDD8ybg7S5wAPj5m9VfRP2BAflJ9morZeJs6oEkrFhG/pD+EDLQxeAheVc5n
         7MSeiihikl1vD9ez2J9dnYbHPrQX04CuwDqjQ7qzL6tgBuqA0uPJ2bHyNZS6wPOrmG4U
         13ESO7cI8cc1krt+ftazDcElvTW81vTPjz53vUqZR9q4R++RLXc2jsx9UNuQFXDA48ym
         p/jvV9pVUrI3hdqJElMjJn3nMtK13x+6Qh+UrU9f452mK7Y/DpCwCGyGKOzUP9/sOhIi
         2zrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781167; x=1789385967;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gvn/5UwHYBqPMMFPFmFGu9hDeKbnn2ym8sNSpP3zJ9Y=;
        b=DcYnb+5XTLyw/mTw7tXvGqqrNgE/xdjOnlXcPFJl8Zx3ydoRX3T4yoPdj3wQQGqVG2
         3rk7s3Mdgq5OBvpeg755rrLuhWwVNGvjLZH5fpDCuzypp400UG8fH/GGyqQbtFWvZlHG
         ea+wbzSH5z9Vo8fFGfYcrbgGTt78Wm3mFSMqEBwxv/wBi5DSzCSrc5MXuY2Al+pWu2Wh
         8/vT+xQDqBzR/wFynFGgnshnPCgF6pogCef7MVeIeh5O5aB1PodTjMRt6awDHVAHlPF0
         hZdjONcLRCj2xtwdytWZJHOb2b1tNn+LokwiXJ7m5gUKRVBdCeFbX0VoHJdGeATZOoRU
         RQtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHX0SvPokWa8UKlfIPhEZ0hS993UIqIqtCRC/42Wo2JHOW3u+tv0XpRPkWfElPpshlQ7HwRrVSz8BC@vger.kernel.org
X-Gm-Message-State: AFuF++nz124pvLUsCtN1aV0uTCajEiLE/GYn7UicMTV37UCdnrC67fE+
	WqHHCQJLPra5DQNhV1Q8LtQzsi/FkL5bCcalJadJZHbFE3ES61i8Tf5v3rJjWDkvFmCB/6UbUcM
	pD4qX9XYPAjRiBzCJf3kFTWHnD1VG22n9xjgv
X-Gm-Gg: AYBFou0gdsXfG5knlMS8NrrwqrYUIBrh1Ss0Bg5Nv0MmUc4nW3Hz+YqQoglOMjhLZP+
	cfZhBmEInhjW7rOXTGk8tFTf8JHQyBpWDmmV6cOL827rq4eYJRNsr8lb1NRIgscFJOntl11ek/g
	UkDq+vTsOtD7HbHPmKjZZSjwGJy1M4aE8dVYSf/FaukR2eUKlYwGOKPZZckFE+AQ/zCQdEyexIW
	2DveEfVuUIs6LOq1K8BLpL3lJT0DdV04a1nUDSKfg4AjIxnhqxhJqDmIwCbSWRpK9x4eNa272OF
	dQDW+s+aJnXUnf3kdaRz+XxFsRNKSE3QfesExKM1NryWReHFp15zME5kd/1pau48EhAZAnS9WsE
	Tlfg9FnvmKvzgcCJIf/VyqBoEYZxpFZfurTsFsOJbHDi+bSyUrtrTg+wTtADSlAvLoh5ywahRLU
	ssS++CHqIDkdyE39Xysa5OrBJbifTXr+DpIcMG/d4/QaI=
X-Received: by 2002:a53:d013:0:b0:66f:d272:86b2 with SMTP id
 956f58d0204a3-66fd2728ac5mr1496947d50.43.1788781167393; Mon, 07 Sep 2026
 04:39:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819222838.21256-1-schmitzmic@gmail.com> <20260819222838.21256-3-schmitzmic@gmail.com>
 <aa508c70-ccd3-4fc0-86fc-e45746e68405@gmx.de>
In-Reply-To: <aa508c70-ccd3-4fc0-86fc-e45746e68405@gmx.de>
From: =?UTF-8?B?TWlybyBLcm9ww6HEjWVr?= <miro.kropacek@gmail.com>
Date: Mon, 7 Sep 2026 21:39:10 +1000
X-Gm-Features: AcwNN1VSWytA-tif6c_qAbMCo0wAQKVoGCOmnNw88oy-w9j4YCde-07QmOf5PAk
Message-ID: <CAN5rfbSkLxZ79LasvCXPsg+HoXzU+xZALZBgxuor4Rc5YjNVhA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] fbdev: Give atafb proper parent
To: Helge Deller <deller@gmx.de>
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org, geert@linux-m68k.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Helge, hi Michael,

On Fri, 21 Aug 2026 at 07:52, Helge Deller <deller@gmx.de> wrote:
> I fixed this comment up to become:
> + * int (*detect)(struct fb_info *info)
>
> Other than that I've replaced the latest patch series by this series in
> the fbdev for-next git tree.

I ran the reworked version on a Falcon (CT60, SuperVidel). The console
comes up on the external path at 1920x1080 in 16bpp and 32bpp,
/sys/class/graphics/fb0/device is there and Xorg fbdev starts, so no
regression here.

-- 
http://mikro.atari.org
