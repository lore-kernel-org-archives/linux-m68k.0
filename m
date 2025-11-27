Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DC832A3C6
	for <linux-m68k@lists.linux-m68k.org>; Thu, 27 Nov 2025 10:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764238943; cv=none; b=WiQ8FsIIeKkUTMcY1cObUoTw0aa9VRgandSCcNKJbGq+srDSl+abUve1iABNhvStJfeVS0KD7KU9KhXVHKrKf1gp5EGt7ED2rxGi+OXThTIQhOWIIodz3ShPoKSJSZvJHzpqbwtnZR/5V3aoxd/QKdBPJxtBrmpcs8VgSanV1kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764238943; c=relaxed/simple;
	bh=WgZGIDHTZ2yGJPvf3HrBh6RhI6jHlRHm8hDy2sdVpM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UxiVqylZ9iiJDyDk/Pf8BSbyisgN0UofSL4NbgrIb6MesD00IjjgkHmBjITOZUUSN94xp55Jmzlv7dUNCIu4ukhLMUPQvxBONT10wBk6KWG28P/DQNxc0nCGABvmPhZuR9eI9CD09V/4kMhkpowXgA4SpFO6B/WYsJGm8LmufVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5dfccb35b10so425139137.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 27 Nov 2025 02:22:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764238941; x=1764843741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1j09ivE7kOjEbNLk28pWagcV+zggz3YJQi9QBU8ZUiM=;
        b=Oex8/rcWmEOiifQgKO2JAR67CfPxxODFGMF5Kkm9eVoyZ6CzqUUMSQTeaK5qRQaYPg
         D7AVuCCe2VjVpB7OYc+HfiWDSnUsWpGOilwlPf5HWj3RiLmCNLttVD4UaeT2b2FQgAjK
         HXApNr5IwSc5lhToxm/3oOjy4mrv4jrSxm1pTWT7igGHimqpJFpBuMUqGtdkg/hUNgSO
         VK8oH1AYEhm1S/7sVe6wfF04NVXjB3ZVlVeQXOZr2c4PJULrrGxfHQF5Qf+KD+1DivPS
         kbZsqPWMRm4H37A5SRy66ehjg8AeRycJnUDByWHeECFMiU5OT/CsgHBDKmwJEupkpjVM
         u8RA==
X-Forwarded-Encrypted: i=1; AJvYcCUARlc+Zix6MQEqs2CzJBCF/gb6AApwya1/aNvW36rli/Vv4xGEZXA4WnIhdnYD42hpAnnZWLJr8XSD@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxndAnCvQp5OcprL00cFFT8Q/M8oZPsKa3suqa/I2+jE9gOu2jx
	WjMzUhPI2+YMYqwQj2xcWHWy4KvXT0wbWco6f0dNa8bKF/zWRNqW9kPnUBTfRbsc
X-Gm-Gg: ASbGncsRSyqveyQ/y3oU+keENf+lXgr5lFM4xGGYZaV/lRMzSdwED1fE1UMDZZtghaf
	myWbWPuwSFP/50gX6eLB3XUKAduUQpwd5jZSdQiI9XEmSWVW77yq9gDJtPkCuOEJi2Vjfrb33Cn
	GmrYu0DkOgArkW4gcbu2vxrTcF0iJk4zugAvze7qXHwz9yKUkYiMkEJFCyWYBAf3FXl7VkSOwsD
	WndCzBMS/PK9nnnmHieAZzVPFoVJfKA45Onsye5QPdZ5GNk+FTcozyt4vaN9nApjGjUUmowd3h/
	GBjj3enmP0foUhu4VuuYH2H62v+yZ5xrU08aO0S/YzZqj5ULK+5jX+wnLP83N1LxwQiiLYVqPbE
	uB4i1xxAyPYxahJ6qmPfQd+MctO62dUHJPhxMpWuEPe+u5uKvMlj+XQp3g27yC27XxOPZl1AAFx
	lckcgLHEq6baZm2TjGP+DYA9TkoAK9AxfusvoVPnx3uZx6+Jru
X-Google-Smtp-Source: AGHT+IHKRw+s4KSp2gUBRRtEdPYfK67U3NLFCZpqGtW8Du0VzC9I0ohMPzbvL88T815EBNTYWNuB2g==
X-Received: by 2002:a05:6102:4243:b0:5de:e881:1a8d with SMTP id ada2fe7eead31-5e224491296mr3684245137.45.1764238940762;
        Thu, 27 Nov 2025 02:22:20 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93cd7662111sm375476241.13.2025.11.27.02.22.20
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 02:22:20 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5dfa9e34adbso523637137.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 27 Nov 2025 02:22:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWcc/wYl58c5CrpiMZON4uy4MCnz+yZA+ITyZNdFXq6P8752zNGvtMfDcN6mApByiUiTxnQD2FhgS+E@lists.linux-m68k.org
X-Received: by 2002:a05:6102:26d1:b0:5df:3b19:4119 with SMTP id
 ada2fe7eead31-5e2243d73aamr3298264137.26.1764238940353; Thu, 27 Nov 2025
 02:22:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127000505.2117956-1-daniel@thingy.jp> <202511270956.hzGiPzdZ-lkp@intel.com>
 <CAFr9PXngrVvcQ2yO0JUj6ve1T39rWftwECnKfUcV3PcKUCPPmg@mail.gmail.com>
In-Reply-To: <CAFr9PXngrVvcQ2yO0JUj6ve1T39rWftwECnKfUcV3PcKUCPPmg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 11:22:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXMA4seUXqJsoVpuYNVS8wEFWYJKRBSWOZ=vS2Js6Bh3g@mail.gmail.com>
X-Gm-Features: AWmQ_bkWE_UikKHWyVd5p5ZLA9UiWuUIjL7yc4JLz2wDvsO1mNkFp2kBVZB-msg
Message-ID: <CAMuHMdXMA4seUXqJsoVpuYNVS8wEFWYJKRBSWOZ=vS2Js6Bh3g@mail.gmail.com>
Subject: Re: [PATCH] m68k: implement runtime consts
To: Daniel Palmer <daniel@thingy.jp>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, kas@kernel.org, 
	mingo@kernel.org, seanjc@google.com, bp@alien8.de, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

On Thu, 27 Nov 2025 at 11:13, Daniel Palmer <daniel@thingy.jp> wrote:
> On Thu, 27 Nov 2025 at 10:59, kernel test robot <lkp@intel.com> wrote:
> > All warnings (new ones prefixed by >>):
> >
> >    In file included from fs/dcache.c:38:
> >    arch/m68k/include/asm/runtime-const.h: In function '__runtime_fixup_ptr':
> > >> arch/m68k/include/asm/runtime-const.h:28:29: warning: unused variable 'end' [-Wunused-variable]
> >       28 |         const unsigned long end = start + sizeof(*value);
> >          |                             ^~~
> >    arch/m68k/include/asm/runtime-const.h: In function '__runtime_fixup_shift':
> >    arch/m68k/include/asm/runtime-const.h:51:29: warning: unused variable 'end' [-Wunused-variable]
> >       51 |         const unsigned long end = start + sizeof(*insn);
> >          |                             ^~~
>
> I guess this is because allnoconfig results in CONFIG_MMU=n and that means
> that the nommu defines for cache operations are used and those look like:
> #define flush_icache_range(start, len) __flush_icache_all()
>
> And the arguments getting passed aren't used. Also noticed that it's
> start and len
> there not start and end like everywhere else seems to be...
>
> I guess the  flush_icache_range macro needs to be tweaked to not
> trigger the unused
> warning but I'm not sure how right now.

Replacing the macros by static inline functions should fix that.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
