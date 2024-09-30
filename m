Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7851990CD
	for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Sep 2024 17:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727718674; cv=none; b=HwISfC64b+fKbA4knJLpVzYKnIgy2GjXRmxMLaCqOeBVAarADTRRyTSM2yosl50xBb83OpGPOQFycEGiPFZl2teSGi0RfEoJaD46zM5X4cygqBFZw0lGJlivNAbeK90W9j6ccIbwWIov1qL5JfhllOUq7mJVyxGyuYNot+RwnGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727718674; c=relaxed/simple;
	bh=x0pDw+4SzE1MkSrrBfzhcseWxrldz0hn0pxuu1IaAPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uwg6Z40EfJ3XyGgg+mDZffHeSZWxGEXjVJFoTP0e7/ItOeTrooktx8dRIkmmJHpyb7XhU0pUGn8A/EDjsXRZc5p2hCOhbgZBamcc4dscHM3fdPBvdJQlOXns5nhc2gjUzQPVYoTmxQjDAs8Id2bRGqFOp+leaMLSr7f7V766xq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e232e260c2so36866837b3.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Sep 2024 10:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727718668; x=1728323468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ERWUip0Hd+3xSPGc5KF+LIvmSrz8p98q0i+WVSFZa2o=;
        b=KBSTAH5KErThjHXn/Z5kaNmaXKyfpSIWEO/Xzi3LDTeX4HfNGP5TILQKYAqr8zL5QW
         GKwwqqeWAon3TY7BCWZyDyhOLLZWrIBI2r16aSKZWLZAkcN8P/PGnKk6bXq47kc7IISR
         e+PQ9Fb50c3Sk5XN4Y2KbaquJcXxJrd0/LGhhAKUank2tm4E79lZi+W3pJ5lKDDhWFI1
         lZUs5P86sce7VZG/qDDqt27mZiO7ivOCImSyBM+ciKzp/gIU9GFtdCnnbOYIe4aR5HrR
         ny19ftV1RN7G75gnUH02bmb6hGSKe4zlDfNSlxPunO1qcB49if9q+vVHesxJxbxYcBSZ
         pjww==
X-Forwarded-Encrypted: i=1; AJvYcCXKikL1UCx+2IIQe1CF6L1RgH78q3VLqJ8Jg4CigY6JuwjCNYI0uxA6VNlg2V5CjhBc+KD1XIGkTepF@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy5g8CaNrs9eKgHA7rLF6t4GdssyqhyBOTnGq/igO8FtT6hUZJT
	g2M/SOiWl10XpNGsaE/5WWCGwOsz8xy1zm5hW9UxeFuAAuV1pWk10YU5bEnf
X-Google-Smtp-Source: AGHT+IFmON06bYcpO7TY970Qrkb2ik16Bu2xw3yJhzByQX8pERjfHQsK/ksn3ENfehUMY1qAZZatRw==
X-Received: by 2002:a05:690c:30f:b0:699:7b60:d349 with SMTP id 00721157ae682-6e24750fb5emr103183077b3.11.1727718668165;
        Mon, 30 Sep 2024 10:51:08 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e24536d075sm15121147b3.82.2024.09.30.10.51.07
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 10:51:07 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6db4b602e38so37015037b3.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Sep 2024 10:51:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYICO0FPZDVPLbYnq1anBpoJAgxWTbWbCFCbERSAogT6GawY+Ig4FXSNwF6XWrt8ge5xi61sYPKFlf@lists.linux-m68k.org
X-Received: by 2002:a05:690c:c0f:b0:6d3:d842:5733 with SMTP id
 00721157ae682-6e2475e3050mr104508727b3.35.1727718666765; Mon, 30 Sep 2024
 10:51:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930132321.2785718-1-jvetter@kalrayinc.com> <20240930132321.2785718-11-jvetter@kalrayinc.com>
In-Reply-To: <20240930132321.2785718-11-jvetter@kalrayinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Sep 2024 19:50:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX03ornwefrTfSYfH-XoEE4CHN+u5m7ay5_LrTq8XHOJA@mail.gmail.com>
Message-ID: <CAMuHMdX03ornwefrTfSYfH-XoEE4CHN+u5m7ay5_LrTq8XHOJA@mail.gmail.com>
Subject: Re: [PATCH v7 10/10] arm: Align prototype of IO memset
To: Julian Vetter <jvetter@kalrayinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, 
	Yann Sionneau <ysionneau@kalrayinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 3:25=E2=80=AFPM Julian Vetter <jvetter@kalrayinc.co=
m> wrote:
> Align prototype of the memset_io function with the new one from
> iomap_copy.c
>
> Reviewed-by: Yann Sionneau <ysionneau@kalrayinc.com>
> Signed-off-by: Julian Vetter <jvetter@kalrayinc.com>
> ---
> Changes for v7:
> - New patch

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
