Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025FF22DA1F
	for <linux-m68k@lists.linux-m68k.org>; Fri, 22 Aug 2025 07:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755848148; cv=none; b=KWM9q7jy/6pt9VlbFcPc1upPxKO2DZSIM6NtFkFE24bHG5w1quY4QgA/2GuCl7376mUpS6JoUYpBtpmPkA888i789K7I/A79jdzjFebO/iteLjpS3qKRa7hIlqytIGtwUNCVnr03vEK/RBuSa2u+oHGh7MXhnRPDbH1CHpe2x+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755848148; c=relaxed/simple;
	bh=A0+vPu/wd+WvGYzIMjaKFzikEgud+JQ9Glk5HJUmkO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dq5RI/iHhDizfX5xlA2WQDwzwV28zpReIno57NJpFiX5oj7kkJxJ/K+y4UrN9Wt6DNEO+mzeTSTrBW+y+2m590KMmoGNP+ZosaVddaRhSx0dDd9DGdF43KcQnTp//bjK5t1OnnJPq//7x0MKCyTF+pvOuzApLaJiI+NOoIszTTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-51a06a857d2so642093137.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 22 Aug 2025 00:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755848146; x=1756452946;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xinGjvD3l7gJYCYHy1LaMO7SIjn0fYdCjfTyNwQwYe4=;
        b=RAprbosqw/X9u9PLyKUpvWOnwArNuwQxBsxdH/hR9dIlvFv9WttOvM9p/P9GMMUs/w
         4lHPjBiy1sUgkyMwW1Ex9lpQX+gOaegaRKOH9xf7PGU4rOIEzAqc9DapxxnHzBynE+lg
         iXwQVO+Gi/ijGh6Q2QZdyI0jMIha1enImW2Sv0fXuvlZb6VTHKrcx2s0POrnta695xBF
         cjTbZS5e28MLZUzEAojTzeMTQMvMFsmZF4X85QgeJS0zBQrKNTLT4DyFDeUxNeG46qYU
         +VCIAJJwZAH6ODbefc5j7zIWEooI11UAoJth4lmcOLdN/2P2qyCCj2ZXT6xY00BCZp+H
         rM+Q==
X-Gm-Message-State: AOJu0YxEUvDsFnTzAfUOs0bfECDFb1wOMg3g10L4dEH17zZYRa1s2GRh
	jC3S9QOFxyRcFrHt9R4sXhxW38pffZyujb13j1txDRkdGH4L2gI1reDpO6oIzE/+
X-Gm-Gg: ASbGncuUvWheCTBIkGKrFiPXPUA4ogNYeicmtahJPVO3hdPAaK9QzrqNgWc9eOn2Mg6
	LXp3NZCkgwDWaQPA1uQTp1Q5Z6/hydiKmVjOh5TIr2UMAt2LJWvEn3rz6qxduI3py5ys+dPClH5
	Q89lRC8OlIO7uWmmWJWSM/KHstEITGusSyj+lzlbd/UgLo3dRLVZiV51Uu7s8UcFARqj+KGfBVB
	lHR0W+l5ArILNjrXc0YtJrAjSZFhXEtqZz5GcsTn0jHmzcy751aQrNJwQPLpO4xnbo819PP+bzO
	fosrw+GfHg+UNcSsVwSgTRVCJFzoRlAzbU4kGmpSqemOoZSkBM/k6nKd5LKI+UYxVOxDE4cMxxF
	KdJDuyjiQSJdWyCk6LyDOP/X/28uAM9/pqV0mcUxn/D8e455VMB9Hsr6qbd4y
X-Google-Smtp-Source: AGHT+IHPFQxjCL3Y5PH4dNXH345kXy2O0DvZXnBzxi7CyImHbnc+vWyq1q41Qjz/1pw0J10fzUVzOw==
X-Received: by 2002:a05:6102:3589:b0:4fb:ebe1:7db1 with SMTP id ada2fe7eead31-51d0cf0b177mr620164137.12.1755848145529;
        Fri, 22 Aug 2025 00:35:45 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5127f2269f2sm4384202137.11.2025.08.22.00.35.45
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 00:35:45 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-51d805add8aso150258137.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 22 Aug 2025 00:35:45 -0700 (PDT)
X-Received: by 2002:a05:6102:a4b:b0:4f9:6a93:2a3a with SMTP id
 ada2fe7eead31-51d0f0d43c6mr628450137.26.1755848145176; Fri, 22 Aug 2025
 00:35:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <92518308-c763-4591-96ef-6b38c5d8f434@helsinkinet.fi>
In-Reply-To: <92518308-c763-4591-96ef-6b38c5d8f434@helsinkinet.fi>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 Aug 2025 09:35:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWrQOv-7TWQ2Aj6XXq1E_+_gbCda1AyRJ1vOKo7sXXt8g@mail.gmail.com>
X-Gm-Features: Ac12FXxAhvZvQmUmSdZxSiCpTiMzTQlrPLn5cVwcrBzTtq32jEwq_cL2z2H3Phk
Message-ID: <CAMuHMdWrQOv-7TWQ2Aj6XXq1E_+_gbCda1AyRJ1vOKo7sXXt8g@mail.gmail.com>
Subject: Re: v6.16 console issues on Atari Falcon
To: Eero Tamminen <oak@helsinkinet.fi>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

Hi Eero,

On Thu, 21 Aug 2025 at 22:06, Eero Tamminen <oak@helsinkinet.fi> wrote:
> With v6.16 kernel I'm getting following when booting kernel on
> (emulated) 32Mhz Atari Falcon (or Atari TT), to "init" script / Busybox
> shell (on a 4MB EXT2 IDE file system):
> ----------------------------------------------------------------
> Run /init as init process
>    with arguments:
>      /init
>    with environment:
>      HOME=/
>      TERM=linux
>      BOOT_IMAGE=vmlinux
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 6 at ./include/linux/hung_task.h:48
> __down_common+0xb4/0x1ce

Thanks, bisected and reported
https://lore.kernel.org/CAMuHMdXR72M+oiJ_WmuHC0Xkq2m4=zqhP8DtW40mHyJTCdS+ew@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
