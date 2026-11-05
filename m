Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871286;
	b=EIMjJlJzvOAjvEBLrQ2rkthAWITW/3Zg0rdjAG/XZzZntNaBW1cVfzBKeFEzfsIfBJM0
	 5HdYWUM4FBUGHUQzhhU+KFvKWWDFxVQINqZHvDqaQtgVoiSUMKsS+EALR0t4NKAjjzcpe
	 Yf0Oj/Soi5OSbhcGiAzH3nGN7lShoslKQO5la8eMmDnuhMBliaQWshkIfAbXX+AZXkDCc
	 0tlja5Jl1fCa62XxilBi0EhmhqeyFzDtmBa6TVRzYigsS6GQuEJguHcrAbfH0l9ZNaukH
	 qlDKClSccxkEwAzGJ7a30w0KkZZZidzKW17xgqSs+ysMGRJxbga9gi6mIUeDThS2sXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871286;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=DpLYJIWgXoS5zQrloj/RgE/cGCpS34NjW3pzuN6S6xY=;
	b=Fqm6ecidlb7fx0g8N/+7+/A5Oq81vcBm9K4r5HGtwp0uCHNiL45ZZvo0Nj8UTRn1Wpv4
	 cXbctmWTjgZY79OYvoiy+zHL2LAu9vqLCs7Ap/LnXLEYbgiSKz6+gITLMnfQDaHZxE8yb
	 D6z4iLXVLadjy5EWzVU5PHAR28sJ0Ke4KOYizrA/ht+CPqwcqk+0P/u8AOcKkJ2fAWhoD
	 y7m7jOAVaZuxZcjNQafnk57lHbWFtdzDbAwRnBc3kxwA4G+kjcLXQTd5XS5uvA1D8w1zP
	 GbIZmKYrLU1z/kX3KCLLYUusVAbSUomaT/xbo1DGo1zoBIOXID40qpN3yBsVfsvKEsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139D2606A336
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 09:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 139D2606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5eaa5e03c47so461169e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 05 Nov 2026 01:34:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871285; x=1794476085;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DpLYJIWgXoS5zQrloj/RgE/cGCpS34NjW3pzuN6S6xY=;
        b=2Ltt4nQo065fUeSr/m49XZrbQUB3mrJPocY9hkX3+fREBsNTe5UUgPbio4MRgN38R4
         4rklHMSFrS3VRFTQwvJkIY1HqV8FcWOBwsq+KVyEFBFcw8uJYLIsWsPUXMl3hV9PbW7R
         Z8vojDZcC1alQ90Nd0BSq7Z9rfyltYFClkMVc7tgaun4CBMBrk7qDv0ampwHVT74/k2P
         sRUtymP8Sht0EKt5XqoXmjdlpWLQtef05tSo5uEjia60HHWRfrxca4Ialwvm2HV/hBS3
         KI5B//dfj3/Bx95g/uEsA3whRLEQphhTyXAXvewFLzh9gH9I3H4HyuiZqKjtHGBqeocN
         +NxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPhoU5a9k20tKH+Wx18jK02k2eSU/jSq9OX5qKT/ti1hemc2tfnPV/im2K8NVTcHucCJWHupqjcXTc@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z+TzZ41Vvg0ZmDEXxccMmZt8bjXpiKiv3SBydR65abDj3e5qc7E
	I18fV/d5DF1StnofGh7RdNssw9vvJBpwUHRumVUUEP9WroEbeh38ft5DFO4qHsW7U9I=
X-Gm-Gg: AYBFou2qgbnnRTJO7zes4mHDzvGG1MVRVwTqg2FMfmheFhZ79khuuY0QMA3qeF/BLH2
	VeMWvtW76lZOhKByfLc8U6WgV0UrF98TrI0+y33d5zwvLBSBQ2bDvAsMMux9GKeRTCQWHfcK1jw
	l12GJJRb6U/f6fnm/0XloyfFJNuP8SZaP9Cdo2x3K0YftbimXOkqpfwjy+kr8oDgLHN7Mwfnods
	SLMAHXyqmgeqcGEkFRxf0D7GgM8YcIO0yPvVp1Bw7zOKKE5PznUwhQLXYWw5tibRMoNJmHr7ruA
	+KWfaouRFkKkayG/Tp2NWx33iDGc6lYc3u++IIXiQAKrStKHc/IpMqEah1YD2ex3W42y6O9lQU9
	5B24cp94zzkYsvLbogJN75udU9D1cb1Ct4mOBGyYXJbSwvJ4Ccj5oDJaAO2L6l5nJ2HIRJOVDGw
	yf/K09mJprIKa9m53i3XrDqTO2hQIWzJE5COqp6lzo3JIN77TryRBt1f7U7PcVmC/O1kAgrrwL6
	VXns0gOhvhv4ZD8s64MrcVw1ixLJtOFJjm/QYheK/g3DRyY1fZFcGMEH1WTAGsrlgBVSUWQoYtW
	U6wS5XHNu3JZBCOFkUnK7AmwPAP3+v57P0kCgy4R4QuYDUuo5Un6mnKHSL2oC/DVZQ==
X-Received: by 2002:a05:6102:5109:b0:7ce:a840:e736 with SMTP id ada2fe7eead31-7d286957f0fmr1078630137.13.1793871284873;
        Thu, 05 Nov 2026 01:34:44 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26faf6ea9sm3729420137.1.2026.11.05.01.34.43
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:34:43 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7cc7938c5e9so159054137.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 05 Nov 2026 01:34:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxjpdD8losYy3xU9ztRsSzPgveDFZ03JV3BVkL2x+2b6uCNp7ygnfUZ4+buACsiM82O0ykHWWC66v66@lists.linux-m68k.org
X-Received: by 2002:a05:6102:3709:b0:7ca:5626:11e with SMTP id
 ada2fe7eead31-7d286b7fa17mr1126485137.36.1793871283167; Thu, 05 Nov 2026
 01:34:43 -0800 (PST)
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105044046.52180-1-dennylin0707@gmail.com>
In-Reply-To: <20261105044046.52180-1-dennylin0707@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:34:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWzY9YRnGz1Y_60RYP7TH67q8fxi1VNWwkhhc0EUeSCFw@mail.gmail.com>
X-Gm-Features: AclHuK8PYnqOIDpZItZg042mTleQ6jUe2E1wddINt5GGmEiia8n8vhGDZzRowiM
Message-ID: <CAMuHMdWzY9YRnGz1Y_60RYP7TH67q8fxi1VNWwkhhc0EUeSCFw@mail.gmail.com>
Subject: Re: [PATCH] omfs: remove the filesystem
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: me@bobcopeland.com, willy@infradead.org, brauner@kernel.org, 
	viro@zeniv.linux.org.uk, jack@suse.cz, akpm@linux-foundation.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, tsbogend@alpha.franken.de, 
	maddy@linux.ibm.com, linux-karma-devel@lists.sourceforge.net, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 05:41, Hungyu Lin <dennylin0707@gmail.com> wrote:
> OMFS supports the on-disk format used by the long-discontinued Rio Karma
> music player and ReplayTV DVR. While reviewing a fix for incorrect block
> mapping on writes starting beyond EOF, Matthew suggested removing the
> filesystem instead of continuing to maintain it.
>
> Existing OMFS media can still be accessed using an older kernel with OMFS
> support.
>
> Remove the driver, its documentation and build configuration, the
> defconfig entries, and its name from the statmount selftest's filesystem
> list.
>
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

>  arch/m68k/configs/amiga_defconfig             |   1 -
>  arch/m68k/configs/apollo_defconfig            |   1 -
>  arch/m68k/configs/atari_defconfig             |   1 -
>  arch/m68k/configs/bvme6000_defconfig          |   1 -
>  arch/m68k/configs/hp300_defconfig             |   1 -
>  arch/m68k/configs/mac_defconfig               |   1 -
>  arch/m68k/configs/multi_defconfig             |   1 -
>  arch/m68k/configs/mvme147_defconfig           |   1 -
>  arch/m68k/configs/mvme16x_defconfig           |   1 -
>  arch/m68k/configs/q40_defconfig               |   1 -
>  arch/m68k/configs/sun3_defconfig              |   1 -
>  arch/m68k/configs/sun3x_defconfig             |   1 -

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
