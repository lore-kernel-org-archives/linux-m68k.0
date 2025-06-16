Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186602E426F
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 12:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750076969; cv=none; b=cCT6/iLp2ECO6Jef/T77aplDC+Hoz79UAAZzER7+b3V822VRdLLx9scaTt/NKjJKtdiitFDw3B/TRX4UBerUqBTWJbxuPdTuTzqWwaHU/42WZ3I2P0wlu1lmORa13xM3XvOCFrZtfcHe41VL/HYWHM3S2leV++LAt0nLxg9EJXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750076969; c=relaxed/simple;
	bh=KBeol0LscnU95V1Wk1Siiglr8qhGwHo0t5tW+2DcI8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=thGHsbicypzyaCB/+lXecDFT3VjgJhOryDiBNweWXVhtepa22JZdUKMOSl+4SZsRE8ogH+LkzFuIon0dUIXBGh5FRD5s9daby8O2q/8s9we1/XH5jeEUm0aJneDplv+J1y6fg8m/bBt+HW1a+WUEAVAW/PMXgr6sI793BG/uSHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4c6cf5e4cd5so3217120137.2
        for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 05:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750076966; x=1750681766;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=krrdJAdV98dSH2oGlT1FGAIAlsmJZE3bqxD7ticGqNA=;
        b=pHpy+UR27jDWoOM+L1KN6Al2VpN11rQ1q9tPUf57TnuScSyMUpO+LPJXuuNvqrpz8u
         9x3KN6hk1m/EZ329MoMJjKHMdPmT6mljpeXeNeeEOg1bkjPIGQ4HllFvJj4XfZr80dB4
         zQoe6slIaADcKBJhLuRkNe5AWs48ee/DITYfkuhM/pbhi81/CG4Ee+nHX7RO43VBDQTy
         cKflLp/7P+Tlrq3XYF+ir/mXdr+h3vw5fjXXwkAin2RwAtpCMUBjWFPp6NCaR13Ni2Op
         Q3CMUV2qAAagvKsDcAz3uhxVYfJC6uTA7Z2ZkeQmRnI5JoqRHjo2DYRN73LKpPhqVg68
         MHkg==
X-Forwarded-Encrypted: i=1; AJvYcCVul8rxhbKvRw2VGjdzBDDIaFVv2pc0V4ehxJPFBYT3nyA6UtDl8ieg2JsUrHSAYpTuTNgITRQc1cMH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0SDG2RqUMj+lPi2ICpb2wJyF5nkkxlZPbdw1/Z73b80eVaZzY
	kQ+sZfs6eVN6+PYUz1MunlTmf6nOVMug10ItJ+r3y4k24LuK8L9rwKpNk5QSpsxK
X-Gm-Gg: ASbGncuKNkfXGZnvQbsW4NVStSh7krI43usjJpbxMdtGLctm4QyEGzEO3rsxnB2dNQD
	DmJ9xtJ9GAFNOkcWb8S1WrI64cOSKOtaY97DwwQf8GOgR2F+CQ/rWe/6Ou4984ddGmf3+bAu6S4
	mMe5HNm0JwlstBXI8uIfU20xer7vy572Yzc5AWyptiR0GdIoBgnIVasM1W9vPk4JFIpqCCYgIaY
	mUYXsW5CziK2tOBsMZ7IzCioauQaStupeb5wjopR5+CikkhbHgOCDI2pWh3nxzcFWjYHYhrDQ/Y
	z325IS7UMJ3huccTplU+4k9fNt6le8apqYGoeWRMZteS6GRCGmp9iwfFzXNPMMFnG8n3rN2JTkj
	Z8VoVtj5PPCGzDOvXD7P5hbNPId/ewGiFGcE=
X-Google-Smtp-Source: AGHT+IHIARfulHtqDwj+4MeQDVjJVPWd7aLAL2TXxWo6xBShG+GzJ4vwAK170bRzK579AodPKAIWUw==
X-Received: by 2002:a05:6102:2d0c:b0:4dd:b192:960f with SMTP id ada2fe7eead31-4e7f61cea03mr6382210137.13.1750076966394;
        Mon, 16 Jun 2025 05:29:26 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e7e70c4e21sm1191787137.20.2025.06.16.05.29.25
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 05:29:25 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4c6cf5e4cd5so3217103137.2
        for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 05:29:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3KMc7j24mDTImuOpBN5mSkNJtNNpvgZgWF0aC3Ba/jDwmm4WiR24Y1X2smVxlOyQJ5cZRElCk6FT9@vger.kernel.org
X-Received: by 2002:a05:6102:549e:b0:4e7:3e76:cd21 with SMTP id
 ada2fe7eead31-4e7f611aee7mr6243992137.9.1750076965731; Mon, 16 Jun 2025
 05:29:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
 <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org> <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de>
 <0d7b5c87-f0f7-70a4-cf75-5147e67904da@yahoo.com> <131b33a26efd2b0e21dfee784821dcaf3aeddad4.camel@physik.fu-berlin.de>
 <7d9d8c95-1b06-c6c5-0932-7ba3af55829a@linux-m68k.org> <CABq5eXH8S9MVoRi5znU+u7EJPmaRA+8yOyd-QKBJMQa10UoAmw@mail.gmail.com>
 <6c1d08bf4cd4d7c92338357bd61dca8a23559ad0.camel@physik.fu-berlin.de>
 <WtNQmVJr3uIeOkUfpStavGscYvoTLpprxvowAOsqJKw8V7XCOZqKDi3Qw7Z1m8JVMsv71f0VZCVqZ3MiKnjLYp-VwSvtvTLkoVtJpAkA0gA=@r-v-e.co>
 <c4f086207e68843ea154b5d41950957fa11c6837.camel@physik.fu-berlin.de>
 <CAMuHMdU7Px7bT4XCZC=vF6aUFGj8=cd=refOf2u17mRjp2FUSA@mail.gmail.com> <2c10a9539a82b534e4a815361bb24c04d30b7e67.camel@physik.fu-berlin.de>
In-Reply-To: <2c10a9539a82b534e4a815361bb24c04d30b7e67.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Jun 2025 14:29:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXnebgBVWp-uxrmxTFKZkQVU2h-OW7H+7hJ+4beN9DFLg@mail.gmail.com>
X-Gm-Features: AX0GCFv_9YFDdvCUAdLN0D0rTcXlC75p0V5rqdiaeVVxAvZFq3Pf6ApxyvK_O6I
Message-ID: <CAMuHMdXnebgBVWp-uxrmxTFKZkQVU2h-OW7H+7hJ+4beN9DFLg@mail.gmail.com>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: "port-m68k@netbsd.org" <port-m68k@netbsd.org>, 
	"debian-68k@lists.debian.org" <debian-68k@lists.debian.org>, 
	"linux-m68k@vger.kernel.org" <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Mon, 16 Jun 2025 at 14:21, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> I wrote that message on Friday. Odd that your email client claims it was sent today.
> Besides that, I would like to point again at what John Klos wrote in reply to Finn [1].

The increased email traffic during the Linux kernel merge window
causes lots of delayed email :-(

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
