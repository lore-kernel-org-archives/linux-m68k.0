Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07401F608
	for <linux-m68k@lists.linux-m68k.org>; Fri,  8 Mar 2024 00:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709857211; cv=none; b=p56terCwV3sQw57W6QwQoml1GTryy6SqR+91vI5RgwjQhcUUlkZOoP9xytfJoO5w4bzb/ETZDkxQIAZwADoHAhXKXSC2y9TM8uNKtCh44imHanXiLAtHls9QWZLWZ0XYWdXoGfAmq4R6ewOV6kkM2F7DFROP6E/Z5/0/LDhqGhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709857211; c=relaxed/simple;
	bh=vjQy2jUxdJqI0+btRXqPt+LftIvTYpAsbEjyqbNH2G0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mb0eV9C5IjLK29P2hSCELh9x9NY1Ou1QK/Co+7EV6fRp4fomGgmMrA6ryhsZ6zpkQCbcw/4ZCxyXORusRy5eAO56mntPr+4r8rxAvTC2R4WGgcsCLTiw9dA05Vqe+OKejm2UJ6b4qQPfkSt8fV/Mh//tSxLGfmxvJvV1Y+ZUgUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFsWr/zd; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFsWr/zd"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e64647af39so1482634b3a.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 07 Mar 2024 16:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709857209; x=1710462009; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=svu6XFPYrJIgPaJcJPwhWWGV8FofEACs+lhuWp/kjqU=;
        b=AFsWr/zdgl40FBRI9/spc0cfOg8umV+QEh/CrJ4sL7qkF7yIBTBumOaJQMWbkGuN3t
         UQWKKusvGb9KCB9mNX0l3ZxfNR65pKNtINv1JEH8mhn2PfFmS15LyGDO8dsRUQzWpoX5
         uMmfOTpQAYXMzoTwrmSJ2kI8Oj0ihBbUOSwBOg4PlXRu9VTqWfsJKe2oYAOMWwvyTb+6
         in6qxcKnVDjPxVozH50lTz7Sa2OpQ3iizOwGS9dUPFRCiUSlj+UbS0GjwgutjePBwXby
         X+z7coiy2hkeSXs/wiQUfAk4EXnAGIOusWeksmwLUU8/2EeauV0YuPJxRP/6b6CqoPsV
         f6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709857209; x=1710462009;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=svu6XFPYrJIgPaJcJPwhWWGV8FofEACs+lhuWp/kjqU=;
        b=unPPOnAD0daMbUqKedVn647RDS0SBREANVe0EepXpe1Nyr7WYhapYmUgKNt/t0G92x
         fCeYUHmXw4GwsIU/ad6/TAc9hZddtWfzwkeKPKg0rMmG4U71x0CbG5tLx3RZgwvZ/IvZ
         WHRPP6sDKfc006AGHOF6DU/DbUd9gYQ+9Kgg0ivf09XcIIG1dldIPajs9WlZ/5B35kon
         2/8QEwYGlFVvm5Xx2G8NVVKWDfJrWaE/T189Cogn2Yve0lBjukVmFVjEBIy0u2APotGG
         VCOsybWpjd/xZLOhzVVwg4EB4aWTXdMxiODwDMxnRWcmVhXyHscpa8c8ulVGJbv55G1I
         zU+A==
X-Forwarded-Encrypted: i=1; AJvYcCW1zFBuUjFzgPon0AId4dWtDpgLQZItoStosoCmaXrF4rap7S55RHCX+a9m+hoJGexK3UiKbVrtDlI2Yc4TCM2cIXiVs+uyiGs2+7ikkIqA
X-Gm-Message-State: AOJu0YzvudMDlqAJPbI5Gv67sKyowa6FQCBr5Bt2S/R5cSDm8d3HGZXr
	gauKg5+zl3mAD6ASWZrZqPRE5f5WYdE/9k9j6ojBGnDQbisoaQSK
X-Google-Smtp-Source: AGHT+IGmifkw4O5/WhaW0auRrUb1FwJ/QvvNpnhq/p+c2M0oynX6lPpcF1X4ZzToT6kkcW0pR4chnw==
X-Received: by 2002:a05:6a00:2d09:b0:6e6:2947:b78d with SMTP id fa9-20020a056a002d0900b006e62947b78dmr14584727pfb.12.1709857209090;
        Thu, 07 Mar 2024 16:20:09 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:adb8:c71:a09c:347f? ([2001:df0:0:200c:adb8:c71:a09c:347f])
        by smtp.gmail.com with ESMTPSA id j12-20020a056a00234c00b006e662e41293sm1212696pfj.53.2024.03.07.16.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 16:20:08 -0800 (PST)
Message-ID: <56f79fc8-1a62-48af-b2fb-cddace7c828f@gmail.com>
Date: Fri, 8 Mar 2024 13:20:05 +1300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: spinlock recursion when running q800 emulation in qemu
To: Finn Thain <fthain@linux-m68k.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net>
 <0ccf5e42-63ec-a63d-9ee9-7043947637c3@gmail.com>
 <40205038-a7cd-2568-5f8e-2540aca2f84d@linux-m68k.org>
Content-Language: en-US
In-Reply-To: <40205038-a7cd-2568-5f8e-2540aca2f84d@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Finn,

On 7/03/24 12:52, Finn Thain wrote:
> On Wed, 6 Mar 2024, Michael Schmitz wrote:
>
>> There does not appear to be any interrupt nesting here.
>>
> It's not in the backtrace but that doesn't mean much. It would be
> impossible for a lock checker to place all of it's state on the stack.
> If interrupt nesting messed up its state, you won't know it by looking at
> the stack after the fact.

True, we may see the effect only on the next tick.

But we may not need to invoke lock checker corruption in order to 
explain the recursion message.

Reentering the VIA1 timer handler would re-run scheduler_tick(). If the 
prior run has not yet released the run queue lock, we'd get the 
recursion message.

I realized (belatedly) that scheduler_tick() does not run the task 
itself but just causes a reschedule if appropriate, so the probability 
for this condition is quite low. The question is - does the VIA1 timer 
interrupt ever get reentered?

Can you add a printk_once() warning when you see 
arch/m68k/mac/via.c:via_timer_handler() reentered, Guenter?

Cheers,

     Michael



