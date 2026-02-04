Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490443F23AC
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Feb 2026 13:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770210178; cv=pass; b=C0KD/IVmf7GuJo0OgO/YlrxtrGUy8j9+H0jEs9crEk2wt/sACWQoAU61N2ZrwbhPGfghZEeowymzA+RIJEjDopi6iKkD8gYVZwrwvVbX7Lu8eolyymDvHeGbKvIS5Y4i/APH2sVAaLC2ak3dWmUUiX271SGTspPZq1JQrWr3IiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770210178; c=relaxed/simple;
	bh=jqB50L1VPXgD56TAUS5qWxfi8WyhK/RAKlozHuVqM+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PItZ7y8eRms55w6oaz6wvzS36yADk7oqiX2GeTmyaLS8sairEtaXSbPIul+x5JpBsY9JNsC8SaV0VOOQqBaTU01WM1SPh7gWldLtj93gfCUHjYRJJyxWSu/ItB1CVjBPdwQCIJSehd21mVXjoR6a0y5bvVRYx1/XFvT0WhdIKOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=R2/rpsee; arc=pass smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="R2/rpsee"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-81e8b1bdf0cso4300710b3a.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 04 Feb 2026 05:02:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770210177; cv=none;
        d=google.com; s=arc-20240605;
        b=ah54gd60+mz/GvcaIvIzVPr4+olKHQDqG9Hu4AxIF1IXNCEbcCHIzw+fJfNByQYJl8
         ogehnIluvXxj197176Iy110A8OqQ/z62RMxWWZyRXNtXGB/RSXPZnI91tJzz/oNl6ZBv
         SxKsEOgMt1cmDjG2oSqtO9ehcm+WI58tC2e3WSSZW2f1EcVtJ16dY+Es1Jwl3icCLwwq
         n3HXmPrXmtJy5kOi34CFr6dxLl+HaFQzRv1uMETfgwxVgPDnBGiI27Q4QcnEGSzkny/4
         XGU9OVE/cj7Krj1Ejdg2x6RzRlRNwGMx4GACuSKqKN37DBwWn7PWlFjplzfgP2SeHlEO
         4nWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jqB50L1VPXgD56TAUS5qWxfi8WyhK/RAKlozHuVqM+E=;
        fh=7IXdtsk5nc3AhBZ0fqvOvPWtzWtH+Lu1CMs1pP3Pa7U=;
        b=QXBsQ76G94NQxbmf0fYxmzmKmeKlr11fi7roh1HaUAqw3rQyfE8Ddbjzb1Ibey1zP7
         KEoRS4zL30YUCxW+jeCu6N2sfUmEv6/ruGylBuzYdoi4FahJwH7RPHQtiNDiakKs+g5K
         gZ+afxXEWu6OUCGHySu1H8WCXLIRFOWffRRAxWuHS9uJXLOoSdebtoOJebYHTXnFgsBu
         QG680sENWfulG5sd/ZMAUwRgA9q4RrsK/UBzXHaNcOBnERwPuZNFrgOo4Zqo7kw6mwgu
         iB2LpdF3QFdM2uBLrOZFFsQHWqee7b4Vvo2e1OZVW0xoOhL0ZTc7TvN6RXyIlVUh5zV2
         h0Tg==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1770210177; x=1770814977; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jqB50L1VPXgD56TAUS5qWxfi8WyhK/RAKlozHuVqM+E=;
        b=R2/rpseeuWVh7nQohjk6AFrNw+rxTtNo4eOvC7zeAv54fZf2RLu8tEBMcECki/L2zt
         Lcg+lCmWNvnj640raOpxZCbFfmfP08mRLc+hKRtBsedAbi7otKGAXBjsiWS7fJzODwUP
         +q5SuoHARPbh7ikacLJyLmJnFLUheLOCKND00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770210177; x=1770814977;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqB50L1VPXgD56TAUS5qWxfi8WyhK/RAKlozHuVqM+E=;
        b=sXY1zz3nl7xpE4wxi+fRzK9ObHGUHJf9lKoNoE/mHAyO7xYUrpMp85w0qOsAVwSir+
         45NiZwGmLBb9MyWq8xAji0BAAhujluP0VlCEUbUF+xCyGcKdKVcEAdw2hK3g0l60G2F4
         HDdOQYAVgs1N9zmA2vo5V7IpfaDe4oiqgcq9aqs5XbN6PHIGQSnVgRwIXEdOyECZsouI
         FOOQxi3L8VSLUdtBdWv2pfYPBY1AJ7FG52P5J2Ze57Z0DY8GzeZTqnTlIU+10x8auOIO
         wEYbDkhdAHecaY7Or37ksM40ZgJwbH8J3qh37QoSddfzWVn67Yzmc/maINcbzGEPXO/b
         mptQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNdkmGl6GuJmoexummcC8G5/B3we+QeidVMTCIWNeAq+7I8xhcqLjFZBsQseIIZhrC4oI/G8e3mkWJ@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzEnMEdhj4WYB3VFUqoqXzZbL0Dre5/LbL9G5+Cr/0qnbQoL/9g
	03+WHVhwdpRS9aui3bev/BLyROnOKaw5Iw1NAS99gEIOp6osapWEbO/VMTd4Y9FdKZmMh6kQeSQ
	imyd8HW1ag5/X0XDvosoRT6nr+Pd4ZsLGNTwQ4szGuA==
X-Gm-Gg: AZuq6aLZTK3qCLJNX2FgkiPMrlajXeE2UbYnnnClgMW39nqQdFMCUBI8LE1qJ+u5nQ7
	+jG+oyQRRBY1b7Eb7dJ9Kv1ndD/XSBsbYd46XmFUFTikisg+lME4SJF4L0UP+E4nMd1/YsO3tHj
	RfyggIlVOs1/GUxfuTaKKrOMa1IjP/ZNwIDk7H9gvzTaHzbJR7wX8V1a6KKSnznMdduUMyONutT
	Iohb6E/AftY+a0wIvRmczM8LcCQ83QtX8Mckp5hqXx521MjGGRdLBQLemWompnlC/fvmyPJyQ==
X-Received: by 2002:a17:90b:350d:b0:341:315:f4ed with SMTP id
 98e67ed59e1d1-354870eb613mr2584532a91.10.1770210177520; Wed, 04 Feb 2026
 05:02:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203170824.2968045-1-visitorckw@gmail.com>
 <CAMuHMdUMBoLd8cKXMK64qjGfTqQfK21mDAXMh8DdJHkL7QbDVQ@mail.gmail.com>
 <e7ddd671-6e25-4114-9d4c-21ecebe82ef5@vivier.eu> <CAFr9PX=heS=ywLCidd8o_BzS4TS5U=GA8yv7itzNFp5nuwf2XA@mail.gmail.com>
 <2a4ebbea-12c9-4362-aa09-dd3a7de1be46@vivier.eu>
In-Reply-To: <2a4ebbea-12c9-4362-aa09-dd3a7de1be46@vivier.eu>
From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 4 Feb 2026 22:02:46 +0900
X-Gm-Features: AZwV_Qizyl8upErpfnTfEOGA157wPCSy37URTJkgip2hxCDhdYxq0FUzjc6r6AU
Message-ID: <CAFr9PXmqSv00Dt=fwwGsDcr8DgpELsa-X=beqazcQOJvxB0=1w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add QEMU virt-ctrl driver and update m68k virt
To: Laurent Vivier <laurent@vivier.eu>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, sre@kernel.org, jserv@ccns.ncku.edu.tw, 
	eleanor15x@gmail.com, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-pm@vger.kernel.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Wed, 4 Feb 2026 at 21:53, Laurent Vivier <laurent@vivier.eu> wrote:
> How to use it with QEMU? Do we need some changes in the code?

You just load u-boot instead of the linux kernel. I don't think you
can actually do much with it because there's no virtio support to load
linux etc yet.
But I have that all working in my own branch and now Kuan-Wei has got
the first parts merged adding the remaining parts to boot linux
shouldn't be too difficult.

Cheers,

Daniel
