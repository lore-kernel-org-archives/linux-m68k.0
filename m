Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F3237F018
	for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Apr 2026 09:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368332; cv=none; b=HV75CDDNeEiEW8rzDfEXz+XzyxN3JdBzwv6lg4AfQxANiohoBJwIaYFuT9IFz+gwb+lOcv9pzTcDtlGhqttK4WvEBPoFvmDotzQnIGk+0ioWnqIWlxSeB4ZDOk/phC9dEbZ942HvsWzdeFOQMUKYQwFsJsIapWnfErwDef5AK6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368332; c=relaxed/simple;
	bh=WZ0dv++aH+AeLwkvbNXxLqu7wJ3mA6GpS63WG1N27Uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vjvit6Xj9DTAOzjQeIIi+Or4JWnmLxJsoi5sKdwkgxWRvVRt1manUKYnsktb8A85+AGKo72p6f+uEQj2nbhL57vqWeFG7Slua7LI3IkAbkjyqqpt0u8tS9zzPgQY3zSWE/Wi2O+hLGh8uXLWkl9HqISpg+hqcDm40iUxZzV5b/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b8f97c626aaso931599266b.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Apr 2026 02:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368325; x=1777973125;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Al22kA6RCf7FSEzj29cZLSkjdM9EgXxihmBX7/SeSVI=;
        b=GikCH+ubAkAd5jF5DJtlc6fyLEPvK33oaBTkwyCfpXgWUYe84GSXV8XFM5p4hsDrt3
         V68Et4eGEhCi9Tfsd5frb+cZ2sSh448NE1XG8OCXjy68TWHTKMBm/sOsjeXnHnOKiLgA
         6Erq1d4LLQ/UWpYBhyrKXu4j9QPiDcdATXH42zZfd/TcKma7iv/z7+/fDaeMZc0CTdrh
         0+aVlu/5X5b7qZDkJ8YTw6DROGJnRMglw9356K2YG8DxF2E77QIc6mz8/Hpoc8e6qgin
         ikTPMB74HRJKrhmKVixSFEi+BwMek85mzwDo4SKtCK/O/+ksM6LNvAAyG+CDh2nQdFAz
         4RKA==
X-Forwarded-Encrypted: i=1; AFNElJ/RrcNoneSat1Z/sYaJWs6NhWAAKpB3iHJoMhvKcARTqGauOq7OH64o54diLA/wdGy40Rbzft0Xk7+8@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyCFRWgi/CvTaZYuh4gS91pWRvjTnczfeqjaevEBAKCCeoIg58p
	j2Ymv0tKvu4wxFIdmBn2zGV+9W4H5jcM3OAhEvhEMzMqHlfA9gKtbL0Uw3GuDP3Skvk=
X-Gm-Gg: AeBDievcd/hMHr2MkFCaNuvxPeXEaB09ujlqi3IVSlv9qh8HMwqaLFNOVuEZdHa/skv
	nw+yf7juiGmKA2I8Iih1yFP++5i8l5752DfxximTVBzUn7LM+7exvV0HaUbRGiSSWce5yEo5EW1
	tUcoml/Wu5AfVOT9i8M3NqdVcevXzqRByzf1hfWSDD/+BYHHcJTi8gj8riXt7/o9K8hCi5+PFo2
	3kF6UP7Z/DLi7N4QvrzZUofhG6j7UuFUTdK4af3tMI6PpiauYAaBhvzVBrVJ3lGcKV1f5EAQEhM
	5zO341Yl7wMm0gxhMtr9OSp0T5naxzJUuTMMqDoLb3lYv+Sguu+mK1ofsvUA6w0ipY/niKr6gEj
	O66c+ecTAyr7d59RDQdbABmBGMjNxGsmk5co8lf5dcXE+T+436yybnb93Zw9IS4u6yLzFDr24y2
	vgx1t4+ntNMGfbrAttPKwsF0COZQNrMQmFA5uzGQtZcyfmO8g5q3xMQQKByU6PKe3Ie3I3JsE=
X-Received: by 2002:a17:906:ef05:b0:bad:8491:85f3 with SMTP id a640c23a62f3a-bb804c32754mr120645666b.34.1777368324834;
        Tue, 28 Apr 2026 02:25:24 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80853b479sm73574266b.6.2026.04.28.02.25.24
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:25:24 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-67389cf78b0so19496967a12.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Apr 2026 02:25:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9CUJCc6I98eMIZe7aI131vpp523TpWa6j6K/aOHHZn2MEHcf4XsoWwkXg+f6KBYDTcnxIio+t7O+It@lists.linux-m68k.org
X-Received: by 2002:a05:6402:5056:b0:676:d8a1:7a04 with SMTP id
 4fb4d7f45d1cf-679bb09a4admr915149a12.23.1777368324094; Tue, 28 Apr 2026
 02:25:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
In-Reply-To: <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 11:25:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
X-Gm-Features: AVHnY4JEWBVPw4tSjHgbQTia8gZd2WGJ1sv6qLdKJbtvs4hms1blpvc35yb0VWw
Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/9] uaccess: Introduce copy_{to/from}_user_partial()
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Yury Norov <ynorov@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, David Laight <david.laight.linux@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Christophe,

Thanks for your patch!

On Mon, 27 Apr 2026 at 19:18, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
> Today there are approximately 3000 calls for copy_to_user() and
> 3000 calls to copy_from_user().
>
> The majority of callers of copy_{to/from}_user() don't care about the
> return value, they only check whether it is 0 or not, and when it is
> not 0 they handle it as a -EACCES.

I think the "a" can be dropped.

> In order to allow better optimisation of copy_{to/from}_user() when
> the size of the copy is known at build time, create new fonctions

functions

> named copy_{to/from}_user_partial() to be used by the few callers
> that are interested in partial copies and need to now how many

know

> bytes remain at the end of the copy.
>
> For the time being it is just the same as copy_{to/from}_user().
>
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
