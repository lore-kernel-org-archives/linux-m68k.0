Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28882EACF2
	for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Apr 2026 01:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775611067; cv=none; b=pPI57AcOSYzuaR0AzSagmP9s8HcNh8G2yvsWvSrJxkJno1185DVAqGaA+iVGaza70VZCsAohevM6InIhaH/2ZaLt1qzff22ZnjsED5n976dhTiqS7f0tnO428Kr7Li3eSwIKldJYRQqVEcBV0YL9UQsqWZcxYGty//O7DGo8J84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775611067; c=relaxed/simple;
	bh=qxRg4/KujdJygGaKYhOtd4lbi4B+n5SFC8iisN9PMU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IK+jls459Z8MUUeQhL+ntoKOdTpFaKmdfEz+OeQEsAc9GrmX6S5nXcTVI44NJE4WF41vmaaJz+g7jscLEo8AeuZGeRVVonSBnRd7I93yLiGUNJL8+o9WLXD5T8CBtPAEhy91jlezE5WHK7ITLMS0/s3y1DUH1XMojCkSSMPTu0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CUzcx/YP; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUzcx/YP"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b0ba3bfe16so3713675ad.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Apr 2026 18:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775611066; x=1776215866; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A/aTsmzgeQNRHsfKsZRkczuKFNVo1U0MhANZqqEsiB8=;
        b=CUzcx/YPAmkjrNKF4fMMRmKehTkagnLwfdXJf6z4ku+cd4b+qoUYk6MVFa/QttHaqj
         BPJe/pT7HmgBa75ue/jAGQBIRCCWsRdkayuY8xTA2YMnLUFan4JjY0iqJV04tTXBwTOv
         1jAzkW5E51Ux8YltMTnSPTmExcKKMA41alfveXa2n9gT9fRXFD0UxNIEXnrK4NQryrom
         ICukpE9essUDimpPuKKi3fHwmtD51SEK7M80R597d8qJKWnqdZXhI+AmM4GJAykBh5cl
         T54DDX0cgyzvZjYajRMjb5YJuf1tu9YtS8NdRjLFnxkVQMksLPCsA6xPNfL8mWxhP3HN
         s0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775611066; x=1776215866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/aTsmzgeQNRHsfKsZRkczuKFNVo1U0MhANZqqEsiB8=;
        b=I4mcsZFMutAY6BOpOGpVzOeAVSYgtHwPOOacO/qvxOc+7zvlrb1MIJFq4bYi5oS03I
         bhl1PKxrzgBPx/0xEI7bqQRLtkYQCQfUtMG6dbxWH8yoKhFHuSXkviIvmQljfB2utpFp
         KbuHTqv6POnlio7AYkpn18qCjlwUOmf2Vd9g6Egr4LULFVwR9dCPhHyXDBKJ0oTNS1QN
         1CecX4/2xS6kPa9M39W9rfLMQ1t3xavzi+HBCDHGYQfMZEZA9vSdUggs8grIW6N5HwK/
         RPYxC2fCXWZYl6W2aEzyZEvlBPPO0hJOoovp2xGk/NHKCFQHALLADDOj7Djt80N0Gr3T
         9u9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVqslVzwh4xoYz+9NdnbS86neIgrdNksylIuSydMDHCntS/nBRkbic4t2/NxGi8yZcUF6XDKljQn2IH@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YweUx7THniaG384dlb3VMHedhjF2rtd1Tewn2gxbyWo29+tJplV
	dTw83NQQocYCghxwngEfvZ0RZNjEjKQTgXl0SqyJXlNL+NEnesopYpUy
X-Gm-Gg: AeBDiesjARA68niF4eOupZw0Osy85wY7TmXiwXC5i0mZQaD4cAoKPPl45vqMCHGLGN/
	wjpFjf6pbbnS1HLFDQpPbLiwX/H9uoSya4hTFxe7k8zCJ4ZaQi5MonqK8eiFm5BSAPNuDcAbflQ
	F+o+Lg18qG/1uiv7qlLg0WFQU9/THH0LbHWDxUY7HDb0bBlq4bV/WrAITyEWPrdfpC+YTR3BWzb
	zL1io1UqNy38xPau1oFQhykRZuEQxUw02KnyRqd3ZkmjBVjgWuPe69o6f5XuWQHGXIrKUqG6kk/
	2vAEVsPChstoJvL+/+flMXlZPjY9Mk1rDmRCyN+sO6FofUE1J6woloumTPWM+6yzP7SNFMJIqih
	PcilOK0M9rS7ERL7tfJeKf1wKql0xQKc0FVbTx9y1h+7PdaMHDOi/Pbx3er1lXymPzWdU5oqzJN
	tmADfZpJ/hgfk4Npa3LPhCJWFXkLqfEsF1
X-Received: by 2002:a17:903:388b:b0:2ae:5ab4:f4c0 with SMTP id d9443c01a7336-2b28205a9d8mr182845215ad.13.1775611065829;
        Tue, 07 Apr 2026 18:17:45 -0700 (PDT)
Received: from google.com ([2401:fa00:95:201:dab2:836d:86a2:3f7f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af31sm180800305ad.52.2026.04.07.18.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 18:17:45 -0700 (PDT)
Date: Wed, 8 Apr 2026 09:17:41 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org
Cc: jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com, daniel@0x0f.com,
	laurent@vivier.eu, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-pm@vger.kernel.org,
	sre@kernel.org
Subject: Re: [PATCH v3 2/2] m68k: virt: Switch to qemu-virt-ctrl driver
Message-ID: <adWstVinlyrj5t8-@google.com>
References: <20260222173225.1105572-1-visitorckw@gmail.com>
 <20260222173225.1105572-3-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260222173225.1105572-3-visitorckw@gmail.com>

Hi Geert,

On Sun, Feb 22, 2026 at 05:32:25PM +0000, Kuan-Wei Chiu wrote:
> Register the "qemu-virt-ctrl" platform device during board
> initialization to utilize the new generic power/reset driver.
> 
> Consequently, remove the legacy reset and power-off implementations
> specific to the virt machine. The platform's mach_reset callback is
> updated to call do_kernel_restart(), bridging the legacy m68k reboot
> path to the generic kernel restart handler framework for this machine.
> 
> To prevent any regressions in reboot or power-off functionality when
> the driver is not built-in, explicitly select POWER_RESET and
> POWER_RESET_QEMU_VIRT_CTRL for the VIRT machine in Kconfig.machine.
> 
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Since the next merge window is approaching, is there anything else
needed for this to be picked up via the m68k tree?

Regards,
Kuan-Wei

> ---
> Changes in v3:
> - Add 'select POWER_RESET' and 'select POWER_RESET_QEMU_VIRT_CTRL' in
>   Kconfig.machine to avoid restart/power-off regressions.
> 
>  arch/m68k/Kconfig.machine |  2 ++
>  arch/m68k/virt/config.c   | 42 +--------------------------------------
>  arch/m68k/virt/platform.c | 20 ++++++++++++++++---
>  3 files changed, 20 insertions(+), 44 deletions(-)
> 
> diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
> index de39f23b180e..624e6b27f394 100644
> --- a/arch/m68k/Kconfig.machine
> +++ b/arch/m68k/Kconfig.machine
> @@ -133,6 +133,8 @@ config VIRT
>  	select GOLDFISH_TIMER
>  	select GOLDFISH_TTY
>  	select M68040
> +	select POWER_RESET
> +	select POWER_RESET_QEMU_VIRT_CTRL
>  	select RTC_CLASS
>  	select RTC_DRV_GOLDFISH
>  	select TTY
> diff --git a/arch/m68k/virt/config.c b/arch/m68k/virt/config.c
> index 632ba200ad42..b338e2a8da6a 100644
> --- a/arch/m68k/virt/config.c
> +++ b/arch/m68k/virt/config.c
> @@ -13,18 +13,6 @@
>  
>  struct virt_booter_data virt_bi_data;
>  
> -#define VIRT_CTRL_REG_FEATURES	0x00
> -#define VIRT_CTRL_REG_CMD	0x04
> -
> -static struct resource ctrlres;
> -
> -enum {
> -	CMD_NOOP,
> -	CMD_RESET,
> -	CMD_HALT,
> -	CMD_PANIC,
> -};
> -
>  static void virt_get_model(char *str)
>  {
>  	/* str is 80 characters long */
> @@ -33,25 +21,9 @@ static void virt_get_model(char *str)
>  		(u8)(virt_bi_data.qemu_version >> 16),
>  		(u8)(virt_bi_data.qemu_version >> 8));
>  }
> -
> -static void virt_halt(void)
> -{
> -	void __iomem *base = (void __iomem *)virt_bi_data.ctrl.mmio;
> -
> -	iowrite32be(CMD_HALT, base + VIRT_CTRL_REG_CMD);
> -	local_irq_disable();
> -	while (1)
> -		;
> -}
> -
>  static void virt_reset(void)
>  {
> -	void __iomem *base = (void __iomem *)virt_bi_data.ctrl.mmio;
> -
> -	iowrite32be(CMD_RESET, base + VIRT_CTRL_REG_CMD);
> -	local_irq_disable();
> -	while (1)
> -		;
> +	do_kernel_restart(NULL);
>  }
>  
>  /*
> @@ -113,20 +85,8 @@ void __init config_virt(void)
>  		 virt_bi_data.tty.mmio);
>  	setup_earlycon(earlycon);
>  
> -	ctrlres = (struct resource)
> -		   DEFINE_RES_MEM_NAMED(virt_bi_data.ctrl.mmio, 0x100,
> -					"virtctrl");
> -
> -	if (request_resource(&iomem_resource, &ctrlres)) {
> -		pr_err("Cannot allocate virt controller resource\n");
> -		return;
> -	}
> -
>  	mach_init_IRQ = virt_init_IRQ;
>  	mach_sched_init = virt_sched_init;
>  	mach_get_model = virt_get_model;
>  	mach_reset = virt_reset;
> -	mach_halt = virt_halt;
> -
> -	register_platform_power_off(virt_halt);
>  }
> diff --git a/arch/m68k/virt/platform.c b/arch/m68k/virt/platform.c
> index 1560c4140ab9..764f556b4b32 100644
> --- a/arch/m68k/virt/platform.c
> +++ b/arch/m68k/virt/platform.c
> @@ -30,7 +30,10 @@ static int __init virt_platform_init(void)
>  		DEFINE_RES_MEM(virt_bi_data.rtc.mmio + 0x1000, 0x1000),
>  		DEFINE_RES_IRQ(virt_bi_data.rtc.irq + 1),
>  	};
> -	struct platform_device *pdev1, *pdev2;
> +	const struct resource virt_ctrl_res[] = {
> +		DEFINE_RES_MEM(virt_bi_data.ctrl.mmio, 0x100),
> +	};
> +	struct platform_device *pdev1, *pdev2, *pdev3;
>  	struct platform_device *pdevs[VIRTIO_BUS_NB];
>  	unsigned int i;
>  	int ret = 0;
> @@ -57,19 +60,30 @@ static int __init virt_platform_init(void)
>  		goto err_unregister_tty;
>  	}
>  
> +	pdev3 = platform_device_register_simple("qemu-virt-ctrl",
> +						PLATFORM_DEVID_NONE,
> +						virt_ctrl_res,
> +						ARRAY_SIZE(virt_ctrl_res));
> +	if (IS_ERR(pdev3)) {
> +		ret = PTR_ERR(pdev3);
> +		goto err_unregister_rtc;
> +	}
> +
>  	for (i = 0; i < VIRTIO_BUS_NB; i++) {
>  		pdevs[i] = virt_virtio_init(i);
>  		if (IS_ERR(pdevs[i])) {
>  			ret = PTR_ERR(pdevs[i]);
> -			goto err_unregister_rtc_virtio;
> +			goto err_unregister_virtio;
>  		}
>  	}
>  
>  	return 0;
>  
> -err_unregister_rtc_virtio:
> +err_unregister_virtio:
>  	while (i > 0)
>  		platform_device_unregister(pdevs[--i]);
> +	platform_device_unregister(pdev3);
> +err_unregister_rtc:
>  	platform_device_unregister(pdev2);
>  err_unregister_tty:
>  	platform_device_unregister(pdev1);
> -- 
> 2.53.0.345.g96ddfc5eaa-goog
> 
