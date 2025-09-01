Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF782FD7CA
	for <linux-m68k@lists.linux-m68k.org>; Mon,  1 Sep 2025 08:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756716362; cv=none; b=H9dGSKEv45cgoRRXiQcXWOQOs3Cw/PFNwgcVDa3AhWguCTXmRre+vM8ZgU9pWqcxb2r4hcx+lqRfIs1KthfASSuqmYVjo6g8fBanSOsQ8DGddNHKVwPsZ13YB5nEwz+McWjGqnSvBS7ZsxibMfSnNASD/Nzt0aDM5KxKITL/xFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756716362; c=relaxed/simple;
	bh=ZE9gLmPnDqTqk06S/cgXtqlrzst3rOGf71E5ISS59so=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bjBTz58n82guxewp2sOCYURa5llNbJ52Ftq6repJRxoTCn4oqQIu/cTg0l0fkFJb1uMdwGXEsYZcnKg9K3whloyTUJO1vaB9AabRsRYqN8qiTzjk5QP4iZSl8R3WXPNl/V9jGgyS4t4tmqi8KMyZoLHy7P79sx6S0p548fzayiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-544a2339775so280439e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 01 Sep 2025 01:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756716359; x=1757321159;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lu55cGC1shfZahu4nJqSCls01RHf6IMjgCiuEU3j5YM=;
        b=RHRY7WUcVv04Gt9UxdNMpv2KE4vrs26KmImBkqmQkILqVj8nfA6L6cCxkDB8rwcVuq
         XA8iGL9CxQaubERUFu/dnywF+uClnrVegV5NGcjqvW5YCM2aWmi4ATd7GjR5tEDY+DKX
         wWBm51fNpu0sCkXYpqMuF0opjQ0nhpaju9uCzTT0TWlUosk6OlanopU22ayIvwaKnPnB
         4V5sWFl+kNAiKWwOc9K1ZS/xQtTxzcWOfDyVZlVmogAZV8NbsmVnpjSVTKx5B5/B3SSP
         QQ39bPa6P/3S9acpFc+fufupNff0nqTBvqT0VqsTHjLH1Mb/y1cegM2idjIqlALubhTE
         EtHg==
X-Forwarded-Encrypted: i=1; AJvYcCVuGgUQgKl3qDkUDvkkGYgX39XTjneDHAYBiUglTFcAMWwQ99ZQMRkEhrkpbab2L2YkBz7PuXnIZiK7@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yxov77HVq65gD1lD/9pRfsagh3qPxO+xlJvfDtod/l1nm4+iyuT
	7DpCsPzcEdsJrLL/f47DLzdefqfsU1yo95vFB1bHH+k9LHeH8ep8yRckm7E4ok2n
X-Gm-Gg: ASbGncsotJOsDSN/ZTFMiQgUtRzWcQalirIOYI6uKBo6tawqbt7Lggf+G/NGptS6LcJ
	v/NRdfxfzT7+jVnkCWq33ME9mlErUAV2/Cboi5nhE59JNLIJfjoKIfAmDo0v06302O8EfF74ZPq
	tz9rnZdQiaDpxumx8XE2quNLpjgj4tnoC2sACLY/weT6ASmjcG5iL4jsDHbiN/fldBmvpHLg/gt
	tteb4CJFOONDaKftWylP7SZL7A2DCM/VGdRbolAUP8E3Z/8USnSRQ2qUdKK8GldH1d1tolQ0t43
	4FmrLirCss7xWJBunWMQjaRxiehvlBEMX4JaEzt8y7XuPW/y5KD2IBGcWtaXBAlaWq63BenqtZI
	d4mc7Cjea9HnIWTRg4gNg7AlS9OWgl3YUynMQH2D1Qw8UpcHU6Nk9s/sl0jro
X-Google-Smtp-Source: AGHT+IHmezJE8jkSV+YF0RoKB68/bi3yJWhv0F4OIAYrsQTobErDJT/fTEho0TG/WGVToSVbM9ibQQ==
X-Received: by 2002:a05:6122:2022:b0:543:cd49:ce78 with SMTP id 71dfb90a1353d-544a02889edmr1898141e0c.14.1756716359055;
        Mon, 01 Sep 2025 01:45:59 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-544afcfe32dsm1341719e0c.23.2025.09.01.01.45.58
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 01:45:58 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-523264ecab8so1372631137.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 01 Sep 2025 01:45:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEXPNHLmv0giGY7GxxzwsSHozFHZzCS4N7X4uyOd3ERDWEyZgMaEJoy9jYU31Vmdr5BfoC7Gfrb7Dl@lists.linux-m68k.org
X-Received: by 2002:a05:6102:162c:b0:51f:66fc:53b4 with SMTP id
 ada2fe7eead31-52b1bd28af5mr1710735137.30.1756716358063; Mon, 01 Sep 2025
 01:45:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7d9554bfe2412ed9427bf71ce38a376e06eb9ec4.1756087385.git.fthain@linux-m68k.org>
 <20250825032743.80641-1-ioworker0@gmail.com> <c8851682-25f1-f594-e30f-5b62e019d37b@linux-m68k.org>
 <96ae7afc-c882-4c3d-9dea-3e2ae2789caf@linux.dev> <5a44c60b-650a-1f8a-d5cb-abf9f0716817@linux-m68k.org>
 <4e7e7292-338d-4a57-84ec-ae7427f6ad7c@linux.dev> <d07778f8-8990-226b-5171-4a36e6e18f32@linux-m68k.org>
 <d95592ec-f51e-4d80-b633-7440b4e69944@linux.dev> <30a55f56-93c2-4408-b1a5-5574984fb45f@linux.dev>
 <4405ee5a-becc-7375-61a9-01304b3e0b20@linux-m68k.org> <cfb62b9d-9cbd-47dd-a894-3357027e2a50@linux.dev>
In-Reply-To: <cfb62b9d-9cbd-47dd-a894-3357027e2a50@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Sep 2025 10:45:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV-AtPm-W-QUC1HixJ8Koy_HdESwCCOhRs3Q26=wjWwog@mail.gmail.com>
X-Gm-Features: Ac12FXyV9h1utoTEvCbocGnG0IAN7uIVG3x3Lc95GJw3v48XpvYZ_YA0jVY7Wlc
Message-ID: <CAMuHMdV-AtPm-W-QUC1HixJ8Koy_HdESwCCOhRs3Q26=wjWwog@mail.gmail.com>
Subject: Re: [PATCH] atomic: Specify natural alignment for atomic_t
To: Lance Yang <lance.yang@linux.dev>
Cc: Finn Thain <fthain@linux-m68k.org>, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, mhiramat@kernel.org, oak@helsinkinet.fi, 
	peterz@infradead.org, stable@vger.kernel.org, will@kernel.org, 
	Lance Yang <ioworker0@gmail.com>, linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

Hi Lance,

On Thu, 28 Aug 2025 at 04:05, Lance Yang <lance.yang@linux.dev> wrote:
> On 2025/8/28 07:43, Finn Thain wrote:
> > On Mon, 25 Aug 2025, Lance Yang wrote:
> >> Same here, using a global static variable instead of a local one. The
> >> result is consistently misaligned.
> >>
> >> ```
> >> #include <linux/module.h>
> >> #include <linux/init.h>
> >>
> >> static struct __attribute__((packed)) test_container {
> >>      char padding[49];
> >>      struct mutex io_lock;
> >> } cont;
> >>
> >> static int __init alignment_init(void)
> >> {
> >>      pr_info("Container base address      : %px\n", &cont);
> >>      pr_info("io_lock member address      : %px\n", &cont.io_lock);
> >>      pr_info("io_lock address offset mod 4: %lu\n", (unsigned long)&cont.io_lock % 4);
> >>      return 0;
> >> }
> >>
> >> static void __exit alignment_exit(void)
> >> {
> >>      pr_info("Module unloaded\n");
> >> }
> >>
> >> module_init(alignment_init);
> >> module_exit(alignment_exit);
> >> MODULE_LICENSE("GPL");
> >> MODULE_AUTHOR("x");
> >> MODULE_DESCRIPTION("x");
> >> ```
> >>
> >> Result from dmesg:
> >>
> >> ```
> >> [Mon Aug 25 19:33:28 2025] Container base address      : ffffffffc28f0940
> >> [Mon Aug 25 19:33:28 2025] io_lock member address      : ffffffffc28f0971
> >> [Mon Aug 25 19:33:28 2025] io_lock address offset mod 4: 1
> >> ```
> >>
> >
> > FTR, I was able to reproduce that result (i.e. static storage):
> >
> > [    0.320000] Container base address      : 0055d9d0
> > [    0.320000] io_lock member address      : 0055da01
> > [    0.320000] io_lock address offset mod 4: 1
> >
> > I think the experiments you sent previously would have demonstrated the
> > same result, except for the unpredictable base address that you sensibly
> > logged in this version.
>
> Thanks for taking the time to reproduce it!
>
> This proves the problem can happen in practice (e.g., with packed structs),
> so we need to ignore the unaligned pointers on the architectures that don't
> trap for now.

Putting locks inside a packed struct is definitely a Very Bad Idea
and a No Go.  Packed structs are meant to describe memory data and
MMIO register layouts, and must not contain control data for critical
sections.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
