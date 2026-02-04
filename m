Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C6738F241
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Feb 2026 07:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770191813; cv=none; b=AxhM0/OlR5wSf4Nltq0uzOGiyJSqg+h7h1D+2F+vG28vjmIbvQUkriEefex+Rwa+zzWczRjUg+a5n9XdwdZ7bkadvDjfpY/d7mRTWWmg8ktcapXSQguwbwR2WkHBNlCS6LChjlFK4wML7u2e47AhSThpxCkmUsEFegaFbHCSRHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770191813; c=relaxed/simple;
	bh=Bo7ME9ToS5tPp5uXCO48/XFese+VeUE1U4BmF1HgIFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=chWlnNENRYfxnKovbvE/v59CYTawd8O/tqU7hZEA5V3B4Spyf1fh00HCD67eVj3dn20UckG/59qGMUGv6M2Wg8E0dOY6jB0e98UhZlQgveLbPJNn9piGotufDuTuJXLNsOJ5/ursb7TAbp3MWv9l0XfBNPwA9HhhDfsovKm0Ses=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5ecddf73062so387744137.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 03 Feb 2026 23:56:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770191812; x=1770796612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXGWtBpUTgth/iKHPt+hkEg/14yqbliQ+nz6kMcrt74=;
        b=WWEoXjhBaBrnKt4xhvG9fmXg5rfqf1QKSAYATD3NnvY8jfVPMqE9PSXwAGxgsZYQvz
         aamCqfyUO0FwInvmc+olU3JY8+WnJ+OigfDUAfAkNb5EmGjoXE4GsX2N6EqcFgsUl38T
         NS7nkanesl7jVNjyKwWp1BK33DrZ6gU3KX2bYnxsR+vQt493qFOEq9YRMAMBPfeBtKIN
         40p7YRGnd0vvxvJQfGeF6RrLXnT/JwoBbAhlqOQf0EOnOtDd+We6vImgeCwyXbvhaYpg
         RiSh+C1vVk7UGALSdWbUB8XoOfyMXIEvXRvKS4KQWU2mlXhMwxTpatfhxb+zE3Teqltd
         Xjig==
X-Forwarded-Encrypted: i=1; AJvYcCXlXYpBZja9aXe6imp7oVG/F4wxoo2dNAVYDOtXsfqBaW4SSuQIVFiD3PY1gD95SLZvBK4jQ/aaIdMD@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz6aDqfyMe0dOr+1DJJZ0wPqsjFPFd1YUyZ+hQRhNnbh0yXF/Fb
	MwWxrIfGabJyCHyv4PTS+fJhC8g7W9wGQZ/0ZcAEE2PJD7aPS8DFwqlpDJp7dXxM800=
X-Gm-Gg: AZuq6aIHWY/F2S4rPknECznKloTb5N5FbPOoSGCG9v2NGRxWiSJmWV8VYKLN5+CMBq2
	oaYJ5NYGX5ojQERVgQ/aQFsSZwljf+QKbxB4baaE2oWjF/nHPTKVxYp4QrMjBY0fwmk41S3vE/6
	ewdS0tLqkztdMve9LxxoOWUByNG3gSdthYPptTWuxBb3iQu3tk4Z1hn1sldr5A0ZpYosiPGrmjm
	tPNhqCDv0NQE16KBnzqP88qeqGfv3nZ9kw+p1eW4IpYuq9G45EMpZAjWO3S2JqeO5B4hmHthXbr
	SLtpUUsT6qrCq/9S2oD/e28Ulhvkdrpx6G/ICGIyYACIdnF5/qOyzYBDBxLKQoBiBD90MHdTcjS
	AT3tQEme3d3lwyTSEYBIQbgWVmymXW/PrgoXIKXmzFvn5dS74o5bCI9v7f/HbxxfvUYsGvFnQct
	Am8eGplHDcgWQauH9DS3vybNQA8zCDXNvGol5MOXcxmV11PFwe
X-Received: by 2002:a05:6102:cca:b0:5db:dad4:840 with SMTP id ada2fe7eead31-5f92a10d969mr2142129137.12.1770191811821;
        Tue, 03 Feb 2026 23:56:51 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-948dfe58acbsm592352241.2.2026.02.03.23.56.51
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 23:56:51 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-948cce42537so299618241.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 03 Feb 2026 23:56:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVtztCXpqyePhIbmPLQyjKm7qmsATnciXh7FFRE8x/805xNnqvXOKV+oWagEVw/IHhpMPt+7FFxNTSv@lists.linux-m68k.org
X-Received: by 2002:a05:6102:3f10:b0:5ef:b32c:dff8 with SMTP id
 ada2fe7eead31-5f929fb3cf1mr2280613137.5.1770191811365; Tue, 03 Feb 2026
 23:56:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203170824.2968045-1-visitorckw@gmail.com>
In-Reply-To: <20260203170824.2968045-1-visitorckw@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Feb 2026 08:56:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUMBoLd8cKXMK64qjGfTqQfK21mDAXMh8DdJHkL7QbDVQ@mail.gmail.com>
X-Gm-Features: AZwV_QiZ43YMMxxlNYjUnXgr3m8Z6Sx77aM5dfYmM2j6flED7-BvFG_oafzMSL8
Message-ID: <CAMuHMdUMBoLd8cKXMK64qjGfTqQfK21mDAXMh8DdJHkL7QbDVQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add QEMU virt-ctrl driver and update m68k virt
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: sre@kernel.org, jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com, 
	daniel@0x0f.com, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-pm@vger.kernel.org, 
	Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"

CC vivier

On Tue, 3 Feb 2026 at 18:08, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
> Introduce a generic platform driver for the QEMU 'virt-ctrl' device [1]
> and transitions the m68k 'virt' machine to use it, replacing
> architecture-specific hooks.
>
> The new driver ('qemu-virt-ctrl') registers a restart handler and
> populates the global 'pm_power_off' callback.
>
> On the m68k side, the platform initialization is updated to register
> the 'qemu-virt-ctrl' platform device. Additionally, the 'mach_reset'
> hook is bridged to 'do_kernel_restart()' to ensure the kernel's restart
> handler chain is correctly invoked.
>
> Verified on QEMU m68k virt. Both system reset and power-off were
> confirmed functional by invoking 'reboot(LINUX_REBOOT_CMD_RESTART)' and
> 'reboot(LINUX_REBOOT_CMD_POWER_OFF)' from userspace.
>
> Link: https://gitlab.com/qemu-project/qemu/-/blob/v10.2.0/hw/misc/virt_ctrl.c [1]
> ---
> Changes in v2:
> - Use devm_register_sys_off_handler() instead of register_restart_handler()
>   and global pm_power_off.
> - Switch Kconfig to tristate to support modular build.
> - Add .id_table to platform_driver and use MODULE_DEVICE_TABLE() to correct
>   module auto-loading.
>
> v1: https://lore.kernel.org/lkml/20260112182258.1851769-1-visitorckw@gmail.com/
>
> Kuan-Wei Chiu (2):
>   power: reset: Add QEMU virt-ctrl driver
>   m68k: virt: Switch to qemu-virt-ctrl driver
>
>  MAINTAINERS                          |  6 ++
>  arch/m68k/virt/config.c              | 42 +------------
>  arch/m68k/virt/platform.c            | 20 ++++++-
>  drivers/power/reset/Kconfig          | 10 ++++
>  drivers/power/reset/Makefile         |  1 +
>  drivers/power/reset/qemu-virt-ctrl.c | 89 ++++++++++++++++++++++++++++
>  6 files changed, 124 insertions(+), 44 deletions(-)
>  create mode 100644 drivers/power/reset/qemu-virt-ctrl.c
>
> --
> 2.53.0.rc1.225.gd81095ad13-goog
