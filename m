Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB28369223
	for <linux-m68k@vger.kernel.org>; Wed, 11 Feb 2026 10:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770806524; cv=none; b=tu/eq1zl79kNHmBPEjIRkyXiIS4Zj4g4SdMwG3luK+vNbpAJVY5fqeC49GHFjcR9mfDJ8C2ynDhslA6gJLRpAkG9+zCgNKSGOBq7HYI7kLPwRS0gUiNNXCF3U8468zvSx3NN8ODq8/7GxdtZ9J5oTsEdsoakwUNUlnaCcFvP+1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770806524; c=relaxed/simple;
	bh=7n8Ot6ivEC2kmme+/ZBWZGlUjJ3Wlp13oNWYbelFc9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jk0L1/S4d2W8/TwEUTd/068kPRkw9glwVEW5Bdk5gUH1Fl5hwlJhylMiS48cI0pek+5ypz8votAfyJp7j21mvGU6kHbHxicBs2g6/vv8fRZN0aBCYnIz+j1dbRWtxDX1uPVImB1A8Raols/9w/oVhygCE3IDjfYo+oIiCmLB8m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5664848545fso2518922e0c.3
        for <linux-m68k@vger.kernel.org>; Wed, 11 Feb 2026 02:42:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770806522; x=1771411322;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66Hzk9cORdux+/yoo7/DF5gdSFZI8JgtPMi5igX+gu4=;
        b=K8OdpOPBh5DaAK4cOe5S353gnaC+qX7zTZjY82y7ui+gOTdkxExCn2Sc0iEfdq9bjL
         PwQrwHlNM3gCDGciYyME7JCsMRtRN/iyFI7NXxo3FL9oMzqtHfbVniOI78MvGueySSZ9
         RCZkOF1AEPqvKCPjACcQrSHAj8Dy2+9vEXVHqWue818JRDaKCx57n+VK6MLaMF3GYNu7
         X/Y5yNiPbRvkKUO4qKfNOPxtIICHSWiY+36JUHw6xi4jUWOn1GggOHpyhuXt05cakIM9
         pWPMYof98AQfmQfhQM8kv0E+/uZ8fr2R07Se1WDMH1oINxe3CE7QWI5dYsAkYoxazP3Q
         S/4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUliAKWlfA4d5ZfDF8xc8E7e/MVVinaD47LwRi/wzfHREuU/zr8OOCDijD8nEPFIQ24tijb63nwm2Jc@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8EIx79+8qTgPsGZ8oYBv0NtkW/uM7mtobhhp/LFe1f81LDqJ1
	TTMaImoFFqD/AjNsLhtqO8nvkAsKpwzYMHpTVm2hrwCs+3yX6Z79XZW3jg+8BAO4xxo=
X-Gm-Gg: AZuq6aJ8FwTDwIItXWNNSu7S5yCmWntiWbH3Oxdq3vDJQSe6YHfa2/iLwdkjZ7uui6v
	Jnwtdc2zWk3NWsDVh5Vn5IJ6+TvsrxCGSUxQDgv62jyCsd8Bf0tOmUDZTmU62XOfwTalP0tV20v
	sDjDswHMMOBG3WXgb5mEhDppAs6ltg7hlR2LrGTvrfFTWLAwd6EJlt778caRqbZJcgbu06oJ1Me
	bqddaM6SW3grY4JBx3tW7EoKUQPFOvZHZgO6y/gZYXdHeEb9bQpsjk8KX16CsrUgI1QQy/nvduv
	1gj7bl8tZB1uXVLB8oJMtQg9U3fWHMQWLwUZMT/vL/3uiG1o8L7FEQKJo2jdzcTVyy/ypofiFtO
	1LyxR9XvSvPaM0S7hhyXl/0Av1WoL7LT5ow1j0yqQTn2bDAbYnYtF1L/NVP1i2PSHvsh75WhQMP
	CUQ5d3ca6GV8wdmkD+pYSR+XL5vxgvxpoEfO5vYJu0VTstlrgvj9NoR5PIzAYp4AIc
X-Received: by 2002:a05:6122:4f9d:b0:563:7d93:b135 with SMTP id 71dfb90a1353d-5674d906ba0mr244381e0c.2.1770806522000;
        Wed, 11 Feb 2026 02:42:02 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5674bfe5ec0sm481321e0c.5.2026.02.11.02.42.00
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 02:42:00 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5636b2fde95so1565264e0c.1
        for <linux-m68k@vger.kernel.org>; Wed, 11 Feb 2026 02:42:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWUmksvUoeHEILxORJJHJh2rbTF4YckVamHFsIx5OpOA1xoikmhM8yAac/Fo473s3tCEz9D2C7MnuNf@vger.kernel.org
X-Received: by 2002:a05:6122:e445:b0:566:eb31:4715 with SMTP id
 71dfb90a1353d-5674d961419mr236154e0c.8.1770806520193; Wed, 11 Feb 2026
 02:42:00 -0800 (PST)
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
 <CAMuHMdU7Px7bT4XCZC=vF6aUFGj8=cd=refOf2u17mRjp2FUSA@mail.gmail.com>
 <2c10a9539a82b534e4a815361bb24c04d30b7e67.camel@physik.fu-berlin.de>
 <CAMuHMdXnebgBVWp-uxrmxTFKZkQVU2h-OW7H+7hJ+4beN9DFLg@mail.gmail.com>
 <9f1613138de30db0248649e6a36c2b063693057f.camel@physik.fu-berlin.de>
 <f1f4afab-51a4-10b5-106c-e9e6e5528e6f@kolla.no> <9277b6ef0478bc6651c03b4220004a4c8a2e1cdb.camel@physik.fu-berlin.de>
 <e01dfc6d-a45f-4d17-a27c-67f913dc614c@app.fastmail.com>
In-Reply-To: <e01dfc6d-a45f-4d17-a27c-67f913dc614c@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Feb 2026 11:41:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWoO-Hpd3mxr1BXT_cNbvMg45v3ZT8SvxiYAWA3w3W4EQ@mail.gmail.com>
X-Gm-Features: AZwV_QjdYqhBfP6fqC3E2DgnvlbSU8ZPh04iyB8lyEdEJaZjChd-4VBZmVcXOnM
Message-ID: <CAMuHMdWoO-Hpd3mxr1BXT_cNbvMg45v3ZT8SvxiYAWA3w3W4EQ@mail.gmail.com>
Subject: Re: Preliminary results - was: Re: Question on BIGGEST_ALIGNMENT in
 GCC on NetBSD/m68k
To: Arnd Bergmann <arnd@arndb.de>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>, 
	"port-m68k@netbsd.org" <port-m68k@netbsd.org>, 
	"debian-68k@lists.debian.org" <debian-68k@lists.debian.org>, 
	"linux-m68k@vger.kernel.org" <linux-m68k@vger.kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Tue, 6 Jan 2026 at 16:38, Arnd Bergmann <arnd@arndb.de> wrote:
> --- a/include/uapi/linux/rseq.h
> +++ b/include/uapi/linux/rseq.h
> @@ -142,9 +142,13 @@ struct rseq {
>         __u32 mm_cid;
>
>         /*
> -        * Flexible array member at end of structure, after last feature field.
> +        * Flexible array member at end of structure, after last feature field,
> +        * but overlapping with the padding.
>          */
> -       char end[];
> +       union {
> +               __u32 :32;
> +               __DECLARE_FLEX_ARRAY(char, end);
> +       };

After commit d6200245c75e832a ("rseq: Allow registering RSEQ with
slice extension"), the padding must be removed again.

>  } __attribute__((aligned(4 * sizeof(__u64))));
>
>  #endif /* _UAPI_LINUX_RSEQ_H */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
