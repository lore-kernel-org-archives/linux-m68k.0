Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551057;
	b=nLQyHlIw/Ux0qNu16T97jZLmbCUeBGaAkppipcJVxMKKMyBX1jLi2OELmrf2hpzQzosF
	 /bUHRXQg64NPbrYeBUI4C5rtzPJ2Qa18ftu9qXEsTh8vy6teNaOXFDUtE7CiOSDkJmvYB
	 Ucsd/EuCPjZLRpA8bnDjVDN7H5C3YYvEOHiMjgUgV+xeGIs7xh6FDsFh34GvEm0ec3l6L
	 4M8Tq47eW8JdX5P0NTfrqB14+P4mwNKbI2BdXviryVhYQCJc06A+llowyHRR0mI0BYRch
	 5gHjkyJPo6o6KtZK6pViuv0nwBgcOAsFkDDmLnei6M14RAfu/5sMVNs0WsNJMLzz7ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Subject:To:References:
	 Cc:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=GHpCiXrobtjq+79vNH0JP2GJuLZO5PYviPAXuNKXvXU=;
	b=JTGysslZMoL7kJWG3uH/Dwp5MVQCM8FiG+vDnWqYTI65bMcJhhHHcvccx8N/J5qDlibi
	 QW1VOUEuZnP3z4XN18/BySXVaDVm/vuMGZsmP6oB77wEIG6713kcAZiXkga9wsq2c2Phi
	 L2GGq0+mj9RBpWx+19vc+tCBbtqAzY5tHBPlTw2XEfVvRLVmiKlGw6mKnwK+/2EawrjTq
	 sN8+S5c/r4I8mJnR7F2tOeLvxphedqDWM1jeGBWbO1zoOBILNfH4gKVOzbronBYb33jMT
	 xIbCp5/ir4QGfdh+HZ3+UaAJ9dJLLE5vNejUDGRssBx5yAlGaLZCEAutMy9QrXM+arw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rOOW0LFU;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6F3606A32F
	for <linux-m68k@vger.kernel.org>; Wed, 21 Oct 2026 02:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D6F3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rOOW0LFU
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc147d86bebso164592a12.0
        for <linux-m68k@vger.kernel.org>; Tue, 20 Oct 2026 19:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792551057; x=1793155857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GHpCiXrobtjq+79vNH0JP2GJuLZO5PYviPAXuNKXvXU=;
        b=rOOW0LFU9Nic3tkOfZ9safmfimFzgnPg9RA53cW9fNyVz/eMwOnmSZrIEBqalv//pz
         glfYocPPfaEcDdpqjRwf0FRJQD+ue9nkh3LpNi7g2yH9UEOzhltZ5TLYsq/mLT8Cq+/x
         81G2rNC+kc5IS/UzHptyk/JOiT9LzoIl8mDq5ggaQWsI8Bj4xxiiMhfQ0pECKDz3rEdt
         4jz99mnn5mWI13md7lxwwiiEuDMn6z9bNj80RCcOW1jJHGnG2EO+Z2LCHIfsKgJQvCAG
         2+tWDaGpfBXMEgwm53lxLVnb0oNsVIlFBPAK6JmfSk0M5+j29A8/K7es4FeeYvIjZ7ll
         aW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792551057; x=1793155857;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GHpCiXrobtjq+79vNH0JP2GJuLZO5PYviPAXuNKXvXU=;
        b=J1+vewXAkS68o8HiJbnBJfgNJWSEynAdNsS8q/RfB4cdKstt2gJ2Dd57SRj3wyzSUA
         fdWhY2wAiRZ3CxO7tnvv42Qzu9dAtOZAKZMqVoK2H1X0DxsZoupcAjS807nk/NTdgUqM
         EfdgwvHuO7hF4qo3LX1S867X1jDvOJYxjX2eXHYcrBCCY/C/S8xh3w7ontrJjdwMSlCf
         2aI4juODf3oow6BkY89D9QePoKHwyj/vY7yvfmrj79zWoI64doEZH2z1sncb+CM+6yYR
         MMN7gglQtQTLAKvFmuWoT3Fpz6FArQujAMATBnJUmROOzSXQ0PXl6dXVKInNs4e4Wq1V
         hzww==
X-Gm-Message-State: AFq9FYJS850dZsJwZXYo/ssyCJ9tDvbzt7ytRE9/zJTWFzqQGR3xYqud
	sVy2RUvqy66gnhonSYjKTZ9QVSTvNPDvyMJAzaZvC5nSxJLU6rjn6+8c
X-Gm-Gg: AYBFou30q2Caj6ijTL8UuJvSvIoQws+Ilul6u/ZSPxgib57BFfgqmbMfB6Tc2H9gPzC
	5ckwnLKW/84Eey9GranxD+S57LR41PE0z/rvf/7wESU6SV0z05q7xg1y/XhMpLA6SQ6hyi4fE72
	umMkiTgVOMszU0rBkfP/SS7Lu2dHUGXfaNTj7E0GKCV0JovdgTXlbWPLhxQYxxD2Engissl8vHL
	GRoPNMuUlPoKNWOBieqzh4xzw+mj6dro/g/1GcULgZyLTIO3Bc79dxPyH9it8PbjCvGrOnfAKMT
	FtTPa1edwsF6tJI8Xkpd2YcKmhCwDmvoGsaHsFbMn810anySgfPuDE81xwLV9W2OihGuqQLnG5f
	kvARRXOXjuvpNUhFO4btCYeJ9DryUQHrByWfsmoyKG5kMbBOXPOiEayGaud4aVjAv5cbI730wQn
	YyBYyrRPKukdvSV8SL490KdLAueyz2RxieI+S+FWFVLh7eJLJZ5ZagunZYmA25+ql8ePtc4whNl
	wdbYq8EU4z7ylTHRciAr0jCjgQ6NuRINDZh8WJznMVThfoJwzuS1cjbiBP111xsQ77pPypYmbeh
	vKCOqEhHXac=
X-Received: by 2002:a17:90b:4e8e:b0:3ac:36c7:c144 with SMTP id 98e67ed59e1d1-3ad86f28703mr395508a91.28.1792551056635;
        Tue, 20 Oct 2026 19:50:56 -0700 (PDT)
Received: from [10.1.1.24] (122-59-250-182-adsl.sparkbb.co.nz. [122.59.250.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad80fc21dcsm1837926a91.7.2026.10.20.19.50.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2026 19:50:56 -0700 (PDT)
Subject: Re: [PATCH v5] m68k: Fix atari mouse movement
To: Miro Kropacek <miro.kropacek@gmail.com>, geert@linux-m68k.org,
 dmitry.torokhov@gmail.com
References: <20261021000338.2160223-1-miro.kropacek@gmail.com>
 <20261021022336.2232886-1-miro.kropacek@gmail.com>
Cc: linux-m68k@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <c77944ee-f170-ce57-9065-d7d49fcfed6e@gmail.com>
Date: Wed, 21 Oct 2026 15:50:49 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261021022336.2232886-1-miro.kropacek@gmail.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi Miro,

Am 21.10.2026 um 15:23 schrieb Miro Kropacek:
> Kernels are built with -funsigned-char since version 6.2, resulting in
> the signed 8-bit position deltas reported by the IKBD being
> misinterpreted as unsigned.
>
> The hook is handed a raw IKBD packet, so take it as a byte stream and
> apply the sign to the two displacement values alone.
>
> Fixes: 3bc753c06dd02a35 ("kbuild: treat char as always unsigned")
> Link: https://lists.debian.org/debian-68k/2026/08/msg00000.html
> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Miro Kropacek <miro.kropacek@gmail.com>
> Cc: linux-input <linux-input@vger.kernel.org>
> ---
>
> Changes in v5:
>
> - take the packet as u8 * and cast only the two displacement values,
>   as suggested; this drops the call-site cast v4 needed, and with it
>   the -Wpointer-sign warning
> - add the types include atarikb.h now relies on
>
> The same cast of the two displacement values was tested on an Atari
> Falcon030 with CT60 in v1 of this patch; v5 differs from it only in the
> type of the hook argument.
>
> Michael's Reviewed-by from v3 is dropped, as the approach has changed
> twice since.

Dmitry's reasoning makes sense to me, so we're back on v1 with no change 
in functionality.

Looks good to me, feel free to add my Reviewed-by if it helps get this 
merged.

Cheers,

	Michael


>
>  arch/m68k/atari/atakeyb.c        | 2 +-
>  arch/m68k/include/asm/atarikb.h  | 4 +++-
>  drivers/input/mouse/atarimouse.c | 6 +++---
>  3 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/arch/m68k/atari/atakeyb.c b/arch/m68k/atari/atakeyb.c
> index 49a9a459bdf4..b715e2b8351c 100644
> --- a/arch/m68k/atari/atakeyb.c
> +++ b/arch/m68k/atari/atakeyb.c
> @@ -39,7 +39,7 @@ void (*atari_MIDI_interrupt_hook) (void);
>  /* Hook for keyboard inputdev  driver */
>  void (*atari_input_keyboard_interrupt_hook) (unsigned char, char);
>  /* Hook for mouse inputdev  driver */
> -void (*atari_input_mouse_interrupt_hook) (char *);
> +void (*atari_input_mouse_interrupt_hook)(u8 *buf);
>  EXPORT_SYMBOL(atari_input_keyboard_interrupt_hook);
>  EXPORT_SYMBOL(atari_input_mouse_interrupt_hook);
>
> diff --git a/arch/m68k/include/asm/atarikb.h b/arch/m68k/include/asm/atarikb.h
> index 68f3622bf591..bdf67bff1472 100644
> --- a/arch/m68k/include/asm/atarikb.h
> +++ b/arch/m68k/include/asm/atarikb.h
> @@ -15,6 +15,8 @@
>  #ifndef _LINUX_ATARIKB_H
>  #define _LINUX_ATARIKB_H
>
> +#include <linux/types.h>
> +
>  void ikbd_write(const char *, int);
>  void ikbd_mouse_button_action(int mode);
>  void ikbd_mouse_rel_pos(void);
> @@ -37,7 +39,7 @@ extern void (*atari_MIDI_interrupt_hook) (void);
>  /* Hook for keyboard inputdev  driver */
>  extern void (*atari_input_keyboard_interrupt_hook) (unsigned char, char);
>  /* Hook for mouse inputdev  driver */
> -extern void (*atari_input_mouse_interrupt_hook) (char *);
> +extern void (*atari_input_mouse_interrupt_hook)(u8 *buf);
>
>  int atari_keyb_init(void);
>
> diff --git a/drivers/input/mouse/atarimouse.c b/drivers/input/mouse/atarimouse.c
> index b1219cc4d9a2..c5b794262e85 100644
> --- a/drivers/input/mouse/atarimouse.c
> +++ b/drivers/input/mouse/atarimouse.c
> @@ -60,7 +60,7 @@ extern int atari_mouse_buttons;
>
>  static struct input_dev *atamouse_dev;
>
> -static void atamouse_interrupt(char *buf)
> +static void atamouse_interrupt(u8 *buf)
>  {
>  	int buttons, dx, dy;
>
> @@ -71,8 +71,8 @@ static void atamouse_interrupt(char *buf)
>  #endif
>
>  	/* only relative events get here */
> -	dx = buf[1];
> -	dy = buf[2];
> +	dx = (s8)buf[1];
> +	dy = (s8)buf[2];
>
>  	input_report_rel(atamouse_dev, REL_X, dx);
>  	input_report_rel(atamouse_dev, REL_Y, dy);
>
