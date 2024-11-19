Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A82E1448DC
	for <linux-m68k@lists.linux-m68k.org>; Tue, 19 Nov 2024 19:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732043418; cv=none; b=IYYGtC8mZ2R7HLd7idPLGmJl25jjhHJ/NajDGg7Fyi2geVtVxoQpW/8p12fMVmKpIiuCM0dTGOT8dPKgn7AP0Q4+yR84ZeUjkw0Jd91tkcI/YCofUAdHduIurASyL6lIzeFuN+Sbsmzttk0OdqfpkVAmeXRZPPO2DFisnDVQiTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732043418; c=relaxed/simple;
	bh=RWVYc+Gv0yy1iLIGyn2du7NUsZyCtCOl6Qtpuct1yN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cVxPKzgTlBBIeiLDq6CE3MWL1qxngHkxXgoFMDhlt6sRY/muCWrNP1lL64mP3nxadUgd586PZh8c6BoHY5y19U5LbaBKgtdys6Qx0tHn/5uKpa1W9G6meSYVGaB58HNaFrh/0NE4kOHj0DQ7HJVprP+6UUhBCrgAFl2qPiSLAV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=KlU3eAB0; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="KlU3eAB0"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3e602a73ba1so2653894b6e.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 19 Nov 2024 11:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1732043415; x=1732648215; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Kjm4y9u+qo0ilVOYcVP609DD90/m6xwVsGN7E7MELA=;
        b=KlU3eAB03Ftx0F8mIZ993GE233N9OGvjlGXq36mikpmpJoLdkh4uWOi2y+j16BoITx
         Lzv6Kb38/eqYoMWUq+4+Y75+EONdvDPFZ2w/EAJMGB5haORM6lBZlV/zUQM0KG/kJICY
         7QuSy7pHRniLMPjv5wpdnJjlRuPF04fdJ75x5fQNpDWDNHRgFcgiiU2JjlLPtp3T0q5D
         rxxZFkmH8BwPq8Bjvovwj983ytCqqvOu+cDTKRUT4QeFq5IboK4IxO5hRAQneH/PSAS+
         Jms5FHU57wnrZ0+G94LJxmVxMAL79oUDwBxa0HMA/avwQIQ2skD3UcIBf/lg2o/cr6Wo
         +Mqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732043415; x=1732648215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Kjm4y9u+qo0ilVOYcVP609DD90/m6xwVsGN7E7MELA=;
        b=JosGFWySz0QIKO0Td1+SgktnCHRmjOItSORG9KvlXh9unEm3rpgXCboeJimV7vT9oE
         2qswSAkVVKz+Sh91NNsZCYzYO62w6DK60pf8Yl1XkrhsYGG1W6fj7a3FTjyuO1+rB5KP
         NQ77CvK4kPGTrMuaBWLeIsE0gpMlSOAUqB8kUNpwNvG8/30vKDkfAFaSpcKjw3Vanvqx
         X5i77ydciqOoGZCcfXEP9nTzwp//c10B3MAY7dUpRDTAg3litH9qVlvds1YHx49/9WOP
         pR8pFyDH0b/+fn1LwILA1MD3GfWu7c0OlNEgMPNpebb/sAOeaLPhigJGF+Ktye/t6THj
         R3sw==
X-Forwarded-Encrypted: i=1; AJvYcCXLVOtlw9TqLcGqehrCSAQrUC90uh5DhziCQ3NUhroLElOFutH0UbJQC7p0FZI9DiLsd4abdrGLTsM6@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwdXuf4D7aSeKB0akluuMhog6G9AcFzUFoW9uvwRiDq8xWEar16
	QmkeW6Cr1lRObKO9jkY2s6xcHxL3Y3lOvubkwvEMAQznmGWYFZtEIQQdTOAEOsY=
X-Google-Smtp-Source: AGHT+IGbWRHOAVynffDO3NfhL/a16cf5WCnQDD1rRxG3E/m0kh/mUK/t5vOMT48R9jGquaOrmBlhFw==
X-Received: by 2002:a05:6808:1b0f:b0:3e7:c7c9:d8de with SMTP id 5614622812f47-3e7c7c9d915mr11615219b6e.0.1732043414678;
        Tue, 19 Nov 2024 11:10:14 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e7bd03e4d5sm3751487b6e.22.2024.11.19.11.10.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 11:10:14 -0800 (PST)
Message-ID: <5851cd28-b369-4c09-876c-62c4a47c5982@kernel.dk>
Date: Tue, 19 Nov 2024 12:10:13 -0700
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/14] io_uring: specify freeptr usage for
 SLAB_TYPESAFE_BY_RCU io_kiocb cache
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Guenter Roeck <linux@roeck-us.net>, io-uring@vger.kernel.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <20241029152249.667290-1-axboe@kernel.dk>
 <20241029152249.667290-4-axboe@kernel.dk>
 <37c588d4-2c32-4aad-a19e-642961f200d7@roeck-us.net>
 <d4e5a858-1333-4427-a470-350c45b78733@kernel.dk>
 <ffc9d82d-fedf-4253-bbc1-c70c339c8b23@roeck-us.net>
 <CAMuHMdVAnJ8Tczm1=c=HOiWMZrNk0i_c1guUoqQbJRmdaXqPGw@mail.gmail.com>
 <5a7528c4-4391-4bd9-bbdb-a0247f3c76a9@kernel.dk>
 <CAMuHMdX9rHUQYn34_Hz=3TKjbFqzenoDCdwt-Mqk1qXJiG4=Zg@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAMuHMdX9rHUQYn34_Hz=3TKjbFqzenoDCdwt-Mqk1qXJiG4=Zg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/19/24 12:02 PM, Geert Uytterhoeven wrote:
> Hi Jens.
> 
> On Tue, Nov 19, 2024 at 8:00?PM Jens Axboe <axboe@kernel.dk> wrote:
>> On 11/19/24 10:49 AM, Geert Uytterhoeven wrote:
>>> On Tue, Nov 19, 2024 at 5:21?PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>> On 11/19/24 08:02, Jens Axboe wrote:
>>>>> On 11/19/24 8:36 AM, Guenter Roeck wrote:
>>>>>> On Tue, Oct 29, 2024 at 09:16:32AM -0600, Jens Axboe wrote:
>>>>>>> Doesn't matter right now as there's still some bytes left for it, but
>>>>>>> let's prepare for the io_kiocb potentially growing and add a specific
>>>>>>> freeptr offset for it.
>>>>>>>
>>>>>>> Signed-off-by: Jens Axboe <axboe@kernel.dk>
>>>>>>
>>>>>> This patch triggers:
>>>>>>
>>>>>> Kernel panic - not syncing: __kmem_cache_create_args: Failed to create slab 'io_kiocb'. Error -22
>>>>>> CPU: 0 UID: 0 PID: 1 Comm: swapper Not tainted 6.12.0-mac-00971-g158f238aa69d #1
>>>>>> Stack from 00c63e5c:
>>>>>>          00c63e5c 00612c1c 00612c1c 00000300 00000001 005f3ce6 004b9044 00612c1c
>>>>>>          004ae21e 00000310 000000b6 005f3ce6 005f3ce6 ffffffea ffffffea 00797244
>>>>>>          00c63f20 000c6974 005ee588 004c9051 005f3ce6 ffffffea 000000a5 00c614a0
>>>>>>          004a72c2 0002cb62 000c675e 004adb58 0076f28a 005f3ce6 000000b6 00c63ef4
>>>>>>          00000310 00c63ef4 00000000 00000016 0076f23e 00c63f4c 00000010 00000004
>>>>>>          00000038 0000009a 01000000 00000000 00000000 00000000 000020e0 0076f23e
>>>>>> Call Trace: [<004b9044>] dump_stack+0xc/0x10
>>>>>>   [<004ae21e>] panic+0xc4/0x252
>>>>>>   [<000c6974>] __kmem_cache_create_args+0x216/0x26c
>>>>>>   [<004a72c2>] strcpy+0x0/0x1c
>>>>>>   [<0002cb62>] parse_args+0x0/0x1f2
>>>>>>   [<000c675e>] __kmem_cache_create_args+0x0/0x26c
>>>>>>   [<004adb58>] memset+0x0/0x8c
>>>>>>   [<0076f28a>] io_uring_init+0x4c/0xca
>>>>>>   [<0076f23e>] io_uring_init+0x0/0xca
>>>>>>   [<000020e0>] do_one_initcall+0x32/0x192
>>>>>>   [<0076f23e>] io_uring_init+0x0/0xca
>>>>>>   [<0000211c>] do_one_initcall+0x6e/0x192
>>>>>>   [<004a72c2>] strcpy+0x0/0x1c
>>>>>>   [<0002cb62>] parse_args+0x0/0x1f2
>>>>>>   [<000020ae>] do_one_initcall+0x0/0x192
>>>>>>   [<0075c4e2>] kernel_init_freeable+0x1a0/0x1a4
>>>>>>   [<0076f23e>] io_uring_init+0x0/0xca
>>>>>>   [<004b911a>] kernel_init+0x0/0xec
>>>>>>   [<004b912e>] kernel_init+0x14/0xec
>>>>>>   [<004b911a>] kernel_init+0x0/0xec
>>>>>>   [<0000252c>] ret_from_kernel_thread+0xc/0x14
>>>>>>
>>>>>> when trying to boot the m68k:q800 machine in qemu.
>>>>>>
>>>>>> An added debug message in create_cache() shows the reason:
>>>>>>
>>>>>> #### freeptr_offset=154 object_size=182 flags=0x310 aligned=0 sizeof(freeptr_t)=4
>>>>>>
>>>>>> freeptr_offset would need to be 4-byte aligned but that is not the
>>>>>> case on m68k.
>>>>>
>>>>> Why is ->work 2-byte aligned to begin with on m68k?!
>>>>
>>>> My understanding is that m68k does not align pointers.
>>>
>>> The minimum alignment for multi-byte integral values on m68k is
>>> 2 bytes.
>>>
>>> See also the comment at
>>> https://elixir.bootlin.com/linux/v6.12/source/include/linux/maple_tree.h#L46
>>
>> Maybe it's time we put m68k to bed? :-)
>>
>> We can add a forced alignment ->work to be 4 bytes, won't change
>> anything on anything remotely current. But does feel pretty hacky to
>> need to align based on some ancient thing.
> 
> Why does freeptr_offset need to be 4-byte aligned?

Didn't check, but it's slab/slub complaining using a 2-byte aligned
address for the free pointer offset. It's explicitly checking:

	/* If a custom freelist pointer is requested make sure it's sane. */
	err = -EINVAL;
	if (args->use_freeptr_offset &&
	    (args->freeptr_offset >= object_size ||
	     !(flags & SLAB_TYPESAFE_BY_RCU) ||
	     !IS_ALIGNED(args->freeptr_offset, sizeof(freeptr_t))))
		goto out;

-- 
Jens Axboe
