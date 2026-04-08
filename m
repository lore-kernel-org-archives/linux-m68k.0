Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142E7363C61
	for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Apr 2026 09:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639449; cv=none; b=lzKEfen/YCiI5ZVHBMUHiKCiVQY9hD9C2cux5+ax4BbX7acYyvacTKursDnrKnSaUYGMV4XLH4zTkvYiVEF6F2k4eF3cMj0kJVSVHGSHdUn/7txkgZUTjNVTmxulYrfBkYNWNEwyxfMjNWIG9UfYylt1xuDJpvI/snIiwvMFfVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639449; c=relaxed/simple;
	bh=NiZ+s0ZGVigowFCvlE2fvxIWoHBwW0PQsCbDGneThqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gAXsGkY+eax96mCVsD3ZKe0WY5bYHGHHOaPohf0HZ78g7d5lkYHWJCopnHuc4t27i6CktW+noU2437TdUGKkSaoWX2xH+2sDtrufWeKgULPOIzFmZoaO0Gv+peIV2GRmHM1qy4PudRdMCcUDKS94wsjDIOA0T8gwZn/5LG3Pf2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-94aaa5d3bfcso3490170241.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Apr 2026 02:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639446; x=1776244246;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsjJWmJuXMrykZSTReA2HwDa0URAD8kKTdB9Xt592xo=;
        b=p9idT4ksUFopRk6OruNAOX+E/FGxnq0DMA19I7qSUjVPpk7YqHIQixZTzkWVuz1ldL
         0NkrU9BG+lHqLzlzZcJeR74hAk8C5H3LL15FNaLeKcDLqKE+6hyR1c6hpk1nepFVCd/+
         jmUmNFjABqR41h5N1Guh7oAfUcCecNSQ2s4c+pZz8gaxwkY4Tm9zntBYAXJzgeVLXEFr
         /3Vvhht8TPM/I2BQztzxoeT9zbDh5KQ/i4T7YxkGWYp942DbVrDsIFDG1dtPk8ET7Kfo
         t+0oFjB19f4OsGsmwecVcMdtDdGMI4HOOpYW5OTCGw4SreQbsUmu4zZi7lovU7Bbr/t7
         f0nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQC33+s3RUjIsz4JVCVO98PzILnZW1kN2EexSkhI3TmUJlwB9MNXDg0JHCyP2LqhBX2JPmTG2bky9U@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzHr/hg1lowG35ZTsbNZ6Am5hxLO+Ued3iyOo5NN0G9rTO5XxvC
	0IgcBWq7LiDxj7m9uA7jmWn+rxJHf0q3px4UWPuTWOV0O8jaa9b094QEWQ51Zvnv
X-Gm-Gg: AeBDiescBxQMyRg0m3/eGJSG6cI+2Q8iiIyDowKUdGGCQZdDDazsvyNCJTPTojOOWIp
	8zqm52w9Lk5JaG0RS/O0mMVOwjzgG69sXT759QAjBhOFoliUXWRAmIfctPf/QfYQ4naeVo6xlxq
	wvh9opxbNFyjgau01caiXekBwPDMpzrKdiP61EpLfLQR8AMfglpzkIXNjpJszuBPh5R/NMPt4A7
	JFJMBlKVKOD6BVb3IU39sx6mhcJLJbXdltpSU+BEMN9wT7s5gmDsrCjhyTlEC9Ai21gvNWLRlk7
	7Z0gECYxe7iQ2RULpAQwCjzfGht2mvfIKEiBSw2HecopAsyKpgPTSowh05HJCxsnS3ZIlQLeEU5
	mue733CVN2HP5VROKeDnLMAF/aPT/psqC4bn12VG5oH60fSPTHbPe5vHYSP58So3g89Juc6ja5b
	46fSxLfLRmz4nMHKK2qyBUpXFXifGUWBysCRdaleIx6WM7yKCHVJtKu/EAyGrX
X-Received: by 2002:a05:6102:689a:b0:605:2ab5:5c1d with SMTP id ada2fe7eead31-605a5038f29mr7964070137.22.1775639445805;
        Wed, 08 Apr 2026 02:10:45 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582e1cc7dsm19969031137.2.2026.04.08.02.10.45
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:10:45 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-605a27fa8d5so3389101137.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Apr 2026 02:10:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXHb88/dUvDhKuV3iXuZEfhWA01i3HqmaLmB02p5zk81VzgBWMOBgwPeoj03jvgHW7YeK/owlhIS1yx@lists.linux-m68k.org
X-Received: by 2002:a05:6102:f87:b0:604:dfe1:39a7 with SMTP id
 ada2fe7eead31-605a4e316a6mr8103614137.11.1775639445086; Wed, 08 Apr 2026
 02:10:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260222173225.1105572-1-visitorckw@gmail.com>
 <20260222173225.1105572-2-visitorckw@gmail.com> <ac7kP64nbhZzwbJV@venus>
In-Reply-To: <ac7kP64nbhZzwbJV@venus>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 11:10:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUSTdrv9Dswez-QrcFTPwnnFy7m5gc-ScMwBfQLDayQZQ@mail.gmail.com>
X-Gm-Features: AQROBzDu6siDi5HFgMNFc4b4a07emxt4ElMQSw8EVt9effobDq5P9g1f3YZFAZw
Message-ID: <CAMuHMdUSTdrv9Dswez-QrcFTPwnnFy7m5gc-ScMwBfQLDayQZQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] power: reset: Add QEMU virt-ctrl driver
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com, 
	daniel@0x0f.com, laurent@vivier.eu, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 Apr 2026 at 23:52, Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
> On Sun, Feb 22, 2026 at 05:32:24PM +0000, Kuan-Wei Chiu wrote:
> > Add a new driver for the 'virt-ctrl' device found on QEMU virt machines
> > (e.g. m68k). This device provides a simple interface for system reset
> > and power off [1].
> >
> > This driver utilizes the modern system-off API to register callbacks
> > for both system restart and power off. It also registers a reboot
> > notifier to catch SYS_HALT events, ensuring that LINUX_REBOOT_CMD_HALT
> > is properly handled. It is designed to be generic and can be reused by
> > other architectures utilizing this QEMU device.
> >
> > Link: https://gitlab.com/qemu-project/qemu/-/blob/v10.2.0/hw/misc/virt_ctrl.c [1]
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
>
> I think this should be merged with the second patch via the m68k
> tree:
>
> Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Thanks, will queue in the m68k tree for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
