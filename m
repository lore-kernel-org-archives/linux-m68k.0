Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282DD2749DB
	for <linux-m68k@lists.linux-m68k.org>; Tue, 27 May 2025 13:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748354108; cv=none; b=MGhV1RdL5Hqz+w1PIq/dWA3udmC+8hJSqCcdqOXv93sAJQ9pmqnNFBf0l323s/7d3AQcnUD4Mel4EH8EftoP0+1dfPBxBrWT3aohiFNB0UtSker6GrDCLy6LmYHutcjwWnuSPtSjVZomuPVlDBN6s1wMq7oDV9uStE3AcNkKjc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748354108; c=relaxed/simple;
	bh=4/SGG2Bk0JiQCCOE/gDVKw4qap5CovIpn4iXb2SrN8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E6Rjz9RY+Yed3PqI/rbFK40Qa3AVsfX18wiPUfgsdnTq05JIgobApZR1dyoEtEBPQ2fKzfJ90HqUUz1XdLqVCcyBfC0ShUVYzYBw1ODCZpI/5bEZBuasBiUr0K5J7Ju8Bn9DguNMwKniQE2PMOzxHUvTM7QYS7fo7p5V6GIoRgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-527b70bd90dso956083e0c.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 May 2025 06:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748354104; x=1748958904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/Vdr1VTrt5GYAjmcNgZJxbWiv4qDWgZ9ZhfhAkHC1Y=;
        b=qyarqHTJQsRugwrOir+841SJkwH0rnoSXyzgYoVrZXInL4vuOu2r8C3Rw74AfR/EQm
         X67EVatZAsSFIKRG+7WnGqYKJSDJat5G5FNouOP6M/Ba74nAJyTyWkW76CUM7AYX4iE+
         PuhLE9wnUYblq+lCo2kpoSzvF8AGrwkPFvezwukCTvuywOiv7zMY8w6Eg/KGtu94+OSn
         RNdvKNRbjPhQbYCq6ydLCSd0m7E1kzioBLxnOBYuHcNsy/IiPdDV2u+S7fWCiMhgwDT0
         dKWid8xgtPQ4PLMr1UKJcq/ny7jUFmEVWKwhOzNx6CSAFf1EpgBnhyVCw6+G84mhCZsL
         IPRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU7vQWSUwnx+ezX3F3tRNdHyGh+8535qjosJSgy6DdPd0wLi+nHzg9pvJk7HhOZhCYV5COF+mvHhov@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yx9Mp01+ra4BFHhHwSsG5H07BpPQuiskgJrFmyJuluCm1FeqkqV
	CvN18Nu2znEUHTz+AjzXKf0Hf4lhxwupwH6bwGWSTLY93bMqPAqlv+qzXgRvFaZT
X-Gm-Gg: ASbGnctAMMKSd5DwIENTnP8h6Ia3SYhPN1asXIWsZ3STx8t6aMRDWLpS8inM5sSs/oO
	YBl1wCCHoyqchLKBLrQYreCzwEhzm92CoOBSU5fl/2GOdOH5tXvM1/mG0MqB+oXVZvYJ/ng8SJn
	pnqksbU1W705v4kG59XjJfkOeSE3pg4L/twostUmIBfV+r7Ce2ZxfOGAoI53cuHD6lG0zhrm3XY
	siq6VHPCoIGQ4GgrurRWcI0J7Oy9j6YsWsMkopwEtlQNMLcdo9aw5ugBk2WCiyE3mIIxcS931XD
	Ee7NqCYKfML+YuKcfemuQ2rG4L5rOaUuv+WVgphOZy2khmbM0AIzZwWJGCcJJu9bd7Ctli0KqFa
	xH+vLUpQI/+tZ9A==
X-Google-Smtp-Source: AGHT+IGZBjN8nXTnRoFbqIhZC+WXAmO7k+LhbUj9tKKxUo+V/zujnU6BEchiNqJg7f6TxvlurDNr2g==
X-Received: by 2002:a05:6122:906:b0:518:6286:87a4 with SMTP id 71dfb90a1353d-52f2c4c326emr9779854e0c.4.1748354103767;
        Tue, 27 May 2025 06:55:03 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5305110d442sm2066616e0c.34.2025.05.27.06.55.03
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 06:55:03 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-87de8a14cd7so959579241.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 May 2025 06:55:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVJOXYjzUIYV4qm5zaRP0+PyQY22DdWQ0NGoxLM4CmdeJVu285mGxjqwAq84k43RXRAZ3qkNuESO4ny@lists.linux-m68k.org
X-Received: by 2002:a05:6102:418c:b0:4e5:9380:9c25 with SMTP id
 ada2fe7eead31-4e59380a399mr1083782137.3.1748354096301; Tue, 27 May 2025
 06:54:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415-kanufahren-besten-02ac00e6becd@brauner>
In-Reply-To: <20250415-kanufahren-besten-02ac00e6becd@brauner>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 May 2025 15:54:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWG5WRf2iP7UABCXMfdy67QHnwPbTEiqt47_7L3=T6jEQ@mail.gmail.com>
X-Gm-Features: AX0GCFv80_VToSfGTvb_hzSwaPcwWfiShLhbpKQer9N8hFIm4Nc_itXj0xnmNpA
Message-ID: <CAMuHMdWG5WRf2iP7UABCXMfdy67QHnwPbTEiqt47_7L3=T6jEQ@mail.gmail.com>
Subject: Re: [RFC PATCH] fs: remove uselib() system call
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Kees Cook <kees@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

Hi Christian,

On Tue, 15 Apr 2025 at 10:31, Christian Brauner <brauner@kernel.org> wrote:
> This system call has been deprecated for quite a while now.
> Let's try and remove it from the kernel completely.
>
> Signed-off-by: Christian Brauner <brauner@kernel.org>

Thanks for your patch, which is now commit 79beea2db0431536 ("fs:
remove uselib() system call") upstream.

> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -479,16 +479,6 @@ config CROSS_MEMORY_ATTACH
>           to directly read from or write to another process' address space.
>           See the man page for more details.
>
> -config USELIB
> -       bool "uselib syscall (for libc5 and earlier)"
> -       default ALPHA || M68K || SPARC
> -       help
> -         This option enables the uselib syscall, a system call used in the
> -         dynamic linker from libc5 and earlier.  glibc does not use this
> -         system call.  If you intend to run programs built on libc5 or
> -         earlier, you may need to enable this syscall.  Current systems
> -         running glibc can safely disable this.
> -
>  config AUDIT
>         bool "Auditing support"
>         depends on NET

FTR, after this m68k machines can still boot the good old
filesys-ELF-2.0.x-1400K-2.gz ramdisk (containing libc5 and these new
kind of binaries called "ELF" ;-) from 1996 fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
