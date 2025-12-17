Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC4F2A1BF
	for <linux-m68k@lists.linux-m68k.org>; Wed, 17 Dec 2025 05:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765948619; cv=none; b=r+9pPTB6zBdm3BKaS48MBJWZ3ig2DOVM8PtR2q2+9M5X6QY8yeMfI5fBvged6sGNxUkFQXe3pujohy3XR6QGPoYd8ikDutgQ0dBk78VPUKq+zZEqiwoOsZv9lLFZdPcSlmQxCZZitWbDpILQVbSYy5O223sNDiNDRoXrPb9s6mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765948619; c=relaxed/simple;
	bh=/jlPoiqgi6X9ie2iedDP5clCEEtvTwbUswfK2n0ew3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kG9CFwq7iEHiqowuU/YcKJHRgrGAUwtRzL+W9u9MGBXI1yrjfx1BSzyTQZYq6Yd5ItoNI3HEFnriFwVrQQYwz209ieczmocEgqC7dhc37+XwSmzE09N8mm/Pf/Rq3lETobEN1edBdPnoFBTDufVZN/uEl0pMl6tqFPEXoQFwLkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D33EYwr/; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D33EYwr/"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-641e942242cso4204638d50.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Dec 2025 21:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765948616; x=1766553416; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3U4fucPIwa5C3A7mTN8iePIKa9pv0/tHUusJYkp2+Y=;
        b=D33EYwr/HIoQsJKuYhFnDBMdAwy5Ig4187xljGt01vPUQvPIDONt4k4D+PApVYACKT
         M5KdzH+jXW1c35ODUbrbpbNKbtlCSBH62q34E5sI0X1kCsfuVV82dz8sjinJw45PqGOG
         LSl6OBcP3HhLB7uTihtiDAhTjQMi7hM70f4/yQidMqDY7cFt38Iy5vs+fujtS8vGPVQD
         qhW9HzC9Xd2FblD4awrNeWq6j0+8rdeo6C7lU29Skv4t0nCrxGPc1+iFMyEePAMUcKQg
         jGTHEWR7pcjnplta/sOOV76eM69u1dPPQ/XU9M8vyGB7BOKazT831vdSq8txy33cVMYo
         9qvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765948616; x=1766553416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e3U4fucPIwa5C3A7mTN8iePIKa9pv0/tHUusJYkp2+Y=;
        b=UX9dbFSzIJUuJEPf/MjW7A3uSpkP3YO7jv9RC1t6PVD7mGd6tf2EoUJIXrJPYOWj4X
         0ESqI0ijvJNLxe+Gsr6riNyIBqLUTr58/BuQ4iOrjGaCnyA31PY3J/YWUs3GlsOJmjSm
         njGiKYqkii7FaYUy5/kNnemYkTsFzCc7/NPk8vTm0JL24zp5G76XFRDo1y9tLvafVrV/
         aazVdFAMNHdT3lft2IfFJ5X62n6l/MzbOFvdezOiIr7BsjT3extaJMkXHVYCk2Kkjb3D
         bAyqI7DhEI92hR6z6m4zkUO45+lnCMW/3JxlabCzBbeDkSwa7ni7tBLMr3+tiVFmW0cB
         kjUw==
X-Forwarded-Encrypted: i=1; AJvYcCXxyvQdXZEylitluOwfcBwloo3KER0V9LGSsraVR9IqpOuW1Xb4RoXqWLYXRZPb4AlRjkeey0rAN0ZH@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyNJMfh6Z6XCmywfRQZrorkdkrcxscdpYrYRN71nah7Id7iq5WB
	FQnWBJmiINvr7kcjWYFyzLf1NVkYSEAuBeSuL1cKMUYx+PqDfFR809VQ
X-Gm-Gg: AY/fxX6SxrcLQZgkZsV0fwbBDuQTH///LUMQAYRRRKEeOIZYyRg0wWtIELl6li5eBNa
	ZJ2UbfbZ27HiTOpbv7pbg/bt3OR7a75J/83vMdnzsljJGhEnS7NEYOd6C+ZjaGi/GaNI9RPuWei
	OGULA4OZp1jqBlnADRtV1xF+LnLU6wH+e2ZF+9bi84zZGVu7mP8wL649oIsCG2mWfslFkVmF8W8
	S5x3dbMK4vyqe88L2STChAgicLmLUaLd3jSHL9JX2gz5i/xN+RrlLmg/YubH/4xuzdzpOHVS6GB
	rYhk79km2AsXPjUayX2DYHZN1RLIQAsbN4nzJonTMAXOlStrf+UIIRyDSEoc8nJ5Rpz9kK12jQH
	NQ0Bw4VRkNjtp0tGu/aWPlv2g7HQ1Rex46w9+JUh9qUtXdmwL++mFwptewfeuVxgoxMahlj/eg0
	7xKahsto3ObmEfUQatje2CWw==
X-Google-Smtp-Source: AGHT+IHl6JmRY4pmU+6aPgmZru5eursIsfwMpCPv4j6lmgmMPRhAD6OhtZZX534fHOXjHyU3LGVXxw==
X-Received: by 2002:a05:690e:16a0:b0:644:7b59:4216 with SMTP id 956f58d0204a3-645555cda86mr12968997d50.3.1765948616522;
        Tue, 16 Dec 2025 21:16:56 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:52::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64477dab686sm8555903d50.16.2025.12.16.21.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 21:16:56 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Dave Hansen <dave.hansen@intel.com>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@suse.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kernel-team@meta.com,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH v2 2/2] mm/page_alloc: Prevent reporting pcp->batch = 0 [mcf5208evb boot failure]
Date: Tue, 16 Dec 2025 21:16:54 -0800
Message-ID: <20251217051654.80355-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <42143500-c380-41fe-815c-696c17241506@roeck-us.net>
References: 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 16 Dec 2025 13:47:03 -0800 Guenter Roeck <linux@roeck-us.net> wrote:

> Hi,
> 
> On Thu, Oct 09, 2025 at 12:29:31PM -0700, Joshua Hahn wrote:
> > zone_batchsize returns the appropriate value that should be used for
> > pcp->batch. If it finds a zone with less than 4096 pages or PAGE_SIZE >
> > 1M, however, it leads to some incorrect math.
> > 
> > In the above case, we will get an intermediary value of 1, which is then
> > rounded down to the nearest power of two, and 1 is subtracted from it.
> > Since 1 is already a power of two, we will get batch = 1-1 = 0:
> > 
> > 	batch = rounddown_pow_of_two(batch + batch/2) - 1;
> > 
> > A pcp->batch value of 0 is nonsensical. If this were actually set, then
> > functions like drain_zone_pages would become no-ops, since they could
> > only free 0 pages at a time.
> > 
> > Of the two callers of zone_batchsize, the one that is actually used to
> > set pcp->batch works around this by setting pcp->batch to the maximum
> > of 1 and zone_batchsize. However, the other caller, zone_pcp_init,
> > incorrectly prints out the batch size of the zone to be 0.
> > 
> > This is probably rare in a typical zone, but the DMA zone can often have
> > less than 4096 pages, which means it will print out "LIFO batch:0".
> > 
> > Before: [    0.001216]   DMA zone: 3998 pages, LIFO batch:0
> > After:  [    0.001210]   DMA zone: 3998 pages, LIFO batch:1
> > 
> > Instead of dealing with the error handling and the mismatch between the
> > reported and actual zone batchsize, just return 1 if the zone_batchsize
> > is 1 page or less before the rounding.
> > 
> > Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> 
> With this patch in the tree, the qemu 'mcf5208evb' machine fails to boot
> with memory errors such as
> 
> S01syslogd: page allocation failure: order:7, mode:0xcc0(GFP_KERNEL), nodemask=(null)
> CPU: 0 UID: 0 PID: 34 Comm: S01syslogd Not tainted 6.19.0-rc1 #1 NONE
> Stack from 407d7ce0:
>         407d7ce0 403df960 403df960 00000000 00000001 00000007 40027c60 403df960
>         400c06be 00000cc0 00000001 407d7d7e 400bf614 407d7d34 403df3ba 407d7d14
>         407d7db8 400c0e5c 00000cc0 00000000 403df3ba 00000007 00000007 00000cc0
>         000d8000 00000018 0000006c 00000001 00000000 40fe6640 00000000 40fe81e4
>         403ffa40 4085eff4 00000000 00000400 00000000 001008c0 00000000 40854041
>         f4fe0000 00004041 f4fe0000 00000000 00010000 403ffa40 4085ed00 4085e800
> Call Trace: [<40027c60>] dump_stack+0xc/0x10
>  [<400c06be>] warn_alloc+0xdc/0x1bc
>  [<400bf614>] get_page_from_freelist+0x0/0xfa6
>  [<400c0e5c>] __alloc_frozen_pages_noprof+0x6be/0x8be
>  [<400c1358>] get_free_pages_noprof+0x16/0x3e
> 
> Reverting this patch fixes the problem.

Hi Guenter,

Thank you for the report. Daniel Palmer has identified an issue on NOMMU
systems, and I think this is caused by the same issue. It seems like
mcf5208evb is also NOMMU (arch/m68k/Kconfig.cpu shows config M520x depends on
!MMU), so I imagine this is the same issue that was reported.

Andrew let me know that the commit has already been committed to mainline
so I'll be sending up a fix shortly. Sorry about the problem, and thank you
again for reporting it. I hope you have a great day!
Joshua
