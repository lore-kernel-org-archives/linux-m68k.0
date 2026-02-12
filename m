Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65804F4F1
	for <linux-m68k@lists.linux-m68k.org>; Thu, 12 Feb 2026 15:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770910118; cv=none; b=BpMGLYPnY716X2N/ehyrzK1GKacn0j4iM5wp19OMG7dz/HuoFctX4O2KGZRXrV008AFWA8YyWc9+7JJ6vWjcJV7/9AckHmqwwkNC0Jb5euqNVy99QB9iaGcoPWtQys+Nlm+IA6IViqm6pe/sl7GcXguR4G4ScaZFFw4p44mJQPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770910118; c=relaxed/simple;
	bh=pxs8YbD1TjSNqeCrVp0K89guriRQWw3wRcf8TsFR4x4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZKGsaAjJLEOMhxEdV+o/HfDqvHxcJG7qT1oXPMQPha1J7ebnOcqAEEuL580YJrSekGEP/FDFw/L8r5bEr6kUxwQzS43fmXdzScn3fS0YiIs3GkjK1PgsRB1uYYczq3iM2BYrx4yjts9PNMoJFuzoXwHsXhg+t8QkxHvreEbgycA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-566390e7db3so2311352e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 12 Feb 2026 07:28:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770910115; x=1771514915;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1swUXVQRVAJERNN5QK89cxeKMa011a7QNqexhVz+39E=;
        b=kRHGULMN0X0YrgNQuH0OayFwSGlYtHtWwx6zG165Qp0mk5cHEVF6EGnpzjX2WfaFgD
         xuakbS4UDs6nnzjBKAhZL+GZLHo4HLi8M/2jnCLl9Wzb99j2lq+J3eK2V01t30ml1Uhq
         ganu8iiB0bZr8Q8g55j8UPLtLUoIN+AKbwLvjFomTT7YdHkrCgoQvKSk4SHzfDCaAAZy
         W3XWXxKN0GI4AoaJ+1TGKhyXa3Wjcz2uK5eU1tu7pKa14CelLWaWDiSE1gKLa8RASJ9k
         fz4HV7ogqWT0/KhbR5TJSib8jCchvt1A7mj4HSel7y5XA/hfFnINYweGbU+g8qyqO/HG
         JaPA==
X-Forwarded-Encrypted: i=1; AJvYcCUQwN42uLmd4+94SBIrbkcUJhPv0tpeZ+LNW7/I4ZkgnnK3jq7xAYCT15bQ4gqau0E01MAoUt5gCR4L@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzTeyXFZkl6C8tQQyiyYAaFjJn15kWdwiFog1IXAY2z7pTjfrrz
	OlgN83/XF5BJg0u/mcnoAsu8Jc1G0n1LGJ/gYA4z4rQBODE3j3+NVHAM6YwJ5CZ+
X-Gm-Gg: AZuq6aIWEbk2cvD6PyOssinAdd6xrdu353ty8deyODTt4zgOrRztEog2lYlXl8JE+a5
	VWPrsp3SziANFP43iH2vevEvrkXAau+MdU+G19o/AFjI2s8NqM9OiqpTV/4FD4edVukkY5pnh/F
	UD+HiYTl8/JnKGOH6btmCqs8dpEM7UZbLxj3qohZw26bEIpn2z4SlLAjhaBZrkWDtYQ1pmYwdjH
	HHq52C4GOpAgeuDkGyOfR/7NU5bfqaAqirKdFDApm2hZQxvInKwo+jJrcVyTBaEP9VGcLs2oFQm
	NqPinKM8ehtopJ0BQhrWWOY+9gAxJ3rcmt0kEe9BvmK+9Qfk/DnTGXO1ftLYC5D9A8BXpIOavVc
	006pRYA1d2c9lK9Cfw/cnrvCyBYQRZhJAXebdJztKn6Vn+gnPrkh6aMGiP4+bTBjgzzQgYgcKOa
	/SEQpEHdKjU1Yvqaw7LNPwsiSwXHB0c2mZfGXpqabqcTkklKsOtVd8gVb95dua
X-Received: by 2002:a05:6122:338a:b0:563:618f:b7e1 with SMTP id 71dfb90a1353d-5675b69ccfbmr621124e0c.4.1770910115236;
        Thu, 12 Feb 2026 07:28:35 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5674bc76b6asm1980899e0c.0.2026.02.12.07.28.35
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 07:28:35 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5fd05e8d317so1831142137.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 12 Feb 2026 07:28:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU7RdYtVWQIvsEuLxT8v7DHJNGsIoImrxh+FXeUU31WszgMteUANOe4bVhMdhPiV0wxqXDBNxPtldn7@lists.linux-m68k.org
X-Received: by 2002:a05:6102:26cc:b0:5fd:eb2d:e714 with SMTP id
 ada2fe7eead31-5fe006b511fmr835506137.22.1770910114712; Thu, 12 Feb 2026
 07:28:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206-nbcon-v7-0-62bda69b1b41@debian.org> <20260206-nbcon-v7-1-62bda69b1b41@debian.org>
In-Reply-To: <20260206-nbcon-v7-1-62bda69b1b41@debian.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Feb 2026 16:28:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUVzSQv=Zw7qh3UVYftdb=Am+URJ2dJ9mwD3WXbuNRT5w@mail.gmail.com>
X-Gm-Features: AZwV_QheoIK05fsOpIY7usPxMKv7SFALLCN-Vk5kXX3MLafKpNUG4FK9VCekOcM
Message-ID: <CAMuHMdUVzSQv=Zw7qh3UVYftdb=Am+URJ2dJ9mwD3WXbuNRT5w@mail.gmail.com>
Subject: Re: [PATCH net-next v7 1/4] printk: Add execution context (task
 name/CPU) to printk_info
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	pmladek@suse.com, john.ogness@linutronix.de, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, asantostc@gmail.com, 
	efault@gmx.de, gustavold@gmail.com, calvin@wbinvd.org, jv@jvosburgh.net, 
	mpdesouza@suse.com, kernel-team@meta.com, 
	linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

Hi Breno,

On Fri, 6 Feb 2026 at 15:39, Breno Leitao <leitao@debian.org> wrote:
> Extend struct printk_info to include the task name, pid, and CPU
> number where printk messages originate. This information is captured
> at vprintk_store() time and propagated through printk_message to
> nbcon_write_context, making it available to nbcon console drivers.
>
> This is useful for consoles like netconsole that want to include
> execution context in their output, allowing correlation of messages
> with specific tasks and CPUs regardless of where the console driver
> actually runs.
>
> The feature is controlled by CONFIG_PRINTK_EXECUTION_CTX, which is
> automatically selected by CONFIG_NETCONSOLE_DYNAMIC. When disabled,
> the helper functions compile to no-ops with no overhead.
>
> Suggested-by: John Ogness <john.ogness@linutronix.de>
> Signed-off-by: Petr Mladek <pmladek@suse.com>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Thanks for your patch, which is now commit 60325c27d3cfe134 ("printk:
Add execution context (task name/CPU) to printk_info").

This increases (the IMHO already large) _printk_rb_static_infos
array by another 40 KiB, according to bloat-o-meter:

    _printk_rb_static_infos                   180224  221184  +40960

> --- a/drivers/net/Kconfig
> +++ b/drivers/net/Kconfig
> @@ -341,6 +341,7 @@ config NETCONSOLE_DYNAMIC
>         bool "Dynamic reconfiguration of logging targets"
>         depends on NETCONSOLE && SYSFS && CONFIGFS_FS && \
>                         !(NETCONSOLE=y && CONFIGFS_FS=m)
> +       select PRINTK_EXECUTION_CTX
>         help
>           This option enables the ability to dynamically reconfigure target
>           parameters (interface, IP addresses, port numbers, MAC addresses)

I guess we should start disabling NETCONSOLE_DYNAMIC in the m68k
defconfigs...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
