Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210D83148A1
	for <linux-m68k@lists.linux-m68k.org>; Fri,  5 Dec 2025 09:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764926645; cv=none; b=QU6miWEVd6dYQvjzbYoeUs08jV5PfcOW3yke910Atuom14t96wItUt7AD4bR1DLQPnOjONUOEa5EEnCdwYJQjkN+/YdqFkn4LSPFiRoq0tcETu0x/aZjaz4GBzZNGATM9AGnJ9yIl9dm5oNfLSnmGdyMoP/7qNzrnSll9SdQgBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764926645; c=relaxed/simple;
	bh=Agnrt+zlXfqAyBkX1umXQhxb4bDtHR8MlYVZIicHX50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CQOXC6768urDBIqL7eO5pX65qOj5l1+1rSce8ED1Sn/2CEuNeR5DYRRI4AN2aFqP59beNM2y49ZbDYGNiWsil5a7/nhvfDUvZxB2dZYbVBL/bh8YPpkAhibXj+3y+6pHbmRK/oYXF9dMLSQSLwuJvBVafvQhvOpM/Ar760+h6Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=awNgZU2J; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="awNgZU2J"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-34372216275so2033426a91.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 05 Dec 2025 01:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1764926635; x=1765531435; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Agnrt+zlXfqAyBkX1umXQhxb4bDtHR8MlYVZIicHX50=;
        b=awNgZU2J2PookgDfNMrycETv9fJ8RHf6DHefBS/wFfG8K7JSSRsGm0CsOUJvJ4QcAL
         JhOSra9Rm1GXVlx+kBp+2b8l6b0DeV5geKcYXjyNLZtfV/G5nI5n9czUZlzzfC2nUcIP
         ojYLsBk7x8ZXxmwz+O9USmPEGdGQOWx0BGl40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764926635; x=1765531435;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Agnrt+zlXfqAyBkX1umXQhxb4bDtHR8MlYVZIicHX50=;
        b=soCVKKAE6NOUGclcdgZr3lso2SOWHqyswT3u8ms72LQ2gS2Fu78ETkulH9M8IyuU48
         wOiDoIarvTfkYGO2rbDEY8t1F+0yaAHaix6ODOojknCLBvwvhYyJPM3jUT5YTIKsamfr
         yBilwXosV0ugKru7fR206D4kbe0YpahEmzgNV/hONKyJAR3Ehw7Jea7cJ55kBJQptvry
         5UU1gwZTOWYax3/YWW7K3sFOWT0DVlSGeI9h/mGYtFPVahWNDfKjV4Yge0ixWIQvgCZ+
         tgBvnKFNiEXks14B3OJ2AhlLBLD8GMVZdpnC4vJ57mGF+UgjXIG1pc7OQy/GP698wOKs
         CmgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBkXA4NsM70Qj6gXdak3ORqcozb3hcMXZFzisIYeMsHQQV7Tlqsp+xNvcST7QlfqchML0tdwa7LS31@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzaV51xePfxvHQc31AtCdw1P2RIKFuqpRQ38uS7shBHVUReWHbS
	l6jnWWXbucPBwSFyN6zDIh4q8O8RAlzbJVOEiJIitE+OEltgKdxRpGYZandL8BvMSczg6iieTUB
	tfehE1Et5lGG9snf/KeYVHgY0T05E21QzRNqCM6nD6w==
X-Gm-Gg: ASbGncvvnKE4svpgIWiscgZvQ3GT1q698LjstKlsCYy0tn2BMK+3WCmy4OVGEs4e2v3
	5FDgCG6V7JPHg7YJ/990AFDxTn+Ixh7EmytPTGKyNvJo52+EbzYqMuhVOpXz5V1yoBX3y30Hy0H
	q2zR/ArsKjksI/iWP/jdkcq/OKUze+yJDCNOMe60wpcoNQrsJ7GfEVgKhUKSe/QZHC/Tc/Z1MU/
	KygeIGEn9IOcQYCItCrC4iydgV6ZC2HXnS4a3GDHyNdXJ2CAopgocvAVF1KdBMH61LqTiZe
X-Google-Smtp-Source: AGHT+IEOw548MdKMTZftyNVZPELqp1JrFaodVAmVB/fkgKWTaXcotXK1RdiGGFYAXIcc8rN7D2IA8hJ4dWve1WZENI0=
X-Received: by 2002:a17:90b:17c9:b0:33b:ba50:fccc with SMTP id
 98e67ed59e1d1-349126c8597mr9590835a91.18.1764926635516; Fri, 05 Dec 2025
 01:23:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127000505.2117956-1-daniel@thingy.jp> <202511270956.hzGiPzdZ-lkp@intel.com>
 <CAFr9PXngrVvcQ2yO0JUj6ve1T39rWftwECnKfUcV3PcKUCPPmg@mail.gmail.com>
 <CAMuHMdXMA4seUXqJsoVpuYNVS8wEFWYJKRBSWOZ=vS2Js6Bh3g@mail.gmail.com>
 <CAFr9PXm_8Lyk5rPMWw+mAzu97RRfjLj8NLqz5K0Po4p9PM6FOw@mail.gmail.com> <aTFbI1RKsbEdR2Ph@yoseli-yocto.yoseli.org>
In-Reply-To: <aTFbI1RKsbEdR2Ph@yoseli-yocto.yoseli.org>
From: Daniel Palmer <daniel@thingy.jp>
Date: Fri, 5 Dec 2025 18:23:42 +0900
X-Gm-Features: AWmQ_bm95y55GKRm-h806Gi4jrC-4zbAV_U9EVI2cghncO4ejB7hseaz_ZWKUyk
Message-ID: <CAFr9PXksr=JaO+0gXRoD2zBH4YCGwm=sDqaVb9v0_b7u9=+2eA@mail.gmail.com>
Subject: Re: [PATCH] m68k: implement runtime consts
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	kas@kernel.org, mingo@kernel.org, seanjc@google.com, bp@alien8.de, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jean-Michel,

On Thu, 4 Dec 2025 at 18:57, Jean-Michel Hautbois
<jeanmichel.hautbois@yoseli.org> wrote:
> It would be great to have vDSO at least for sys_get_thread_area() ! I
> implemented something, but if you already have it, please, submit a RFC
> I will test on coldfire !

I will try to clean it up and send it. A very untidy version along
with other stuff I'm messing with is on github[0].
You will also need a patch for your libc to use it. So far I have
worked out how to get glibc[1] and uclibng[2] to work but I haven't
managed to get musl to work yet[3].
Note that I have no idea if it's safe to do what it's doing. ;)

0 - https://github.com/fifteenhex/linux/tree/m68kvdso-20251201
1 - https://github.com/fifteenhex/glibc/tree/m68kgetthreadarea-20251203
2 - https://github.com/fifteenhex/uclibc-ng/tree/m68k-vdsogetthreadarea
3 - https://github.com/fifteenhex/musl/tree/m68kgetthreadarea-20251203

Cheers,

Daniel
