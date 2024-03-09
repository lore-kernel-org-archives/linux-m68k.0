Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAF44CDEB
	for <linux-m68k@lists.linux-m68k.org>; Sat,  9 Mar 2024 20:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710017827; cv=none; b=uYJ7Lyyf7jFhcw0t9ekgAzT8fdWtBcY7KbvlOcf4+ugWOEzhAU2iwT5HVdyy7ydL9oDD8geBOrQCH9Yh75frQXq7fsO2cNs8hGUEOmS8toZx2KNL3FxogKEvbfkRyUqr5aZ/uEYLJbBw2E53Okv1qYUNzHa/l4svDE+cEI2khTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710017827; c=relaxed/simple;
	bh=7WOKB8SwoywcRPLx9kT8ibecDASUzh0UgCNhAZ6hzag=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=c0ti6caYWbh/4Oz/TxbEXPMeLD0SYEMbO7pXMFmuJJlfiXJjnHZJlNEbxOZDX7N7mZapvGbu2wRwc1iXXH5l9GVq+NbHWwwNveErs+dukjZE+Wpe0DcaHilaXF8WI0+fhBOaWbNOjsSg+7oBk+CCgB42JV5FHpPcqM2HH25eTIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7erV4vM; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7erV4vM"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e6082eab17so2943942b3a.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 09 Mar 2024 12:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710017824; x=1710622624; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIsPhratjNhm9QD5pERbVKjNRMpkT7EJkPTfAdueGQY=;
        b=E7erV4vMK+WaTXBF7TtkYZJHmOuRZcFa075OLwk+wvbQYJgvFPO4tUgVSzeEQsIHHG
         Jc6PfP0DR+lyS0RrJ8zHgTYoAkaPZq/+qOejxiSJU2nfuYJRrpmIwNJKbKXX0xA+1eY9
         GZdsxfmgLs8l1yitib5u02B0KopLHWQANWSKjN6ciBE+85JvNqlrR+Smbk69GUzOAzZb
         VieCAx2fC2fxPVCUblspnyLzEWxzBFM64fvvPZC0D4Vc+RbG7QX0cBpbTfbA9y33rjR/
         Xol16mrW4K1NGOZVvn9klwE6hunA0msTU5DAX5vSExRX1U2Z0TnlhhZvbZmzaR5U3R2t
         iExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710017824; x=1710622624;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SIsPhratjNhm9QD5pERbVKjNRMpkT7EJkPTfAdueGQY=;
        b=DUpy1nCrHkSfX6v3YfkwCZ2icC9oWi+EGZkpgelBhFtixMfbWpPHfT8AOhDH1XLPF6
         mIPxZdx30FYRz733WU+dus0nrGgMkVyIcPppSJVZWNAuQTDXQ5BSNddGY6DoHl2QiG02
         5ExekxfSAUg2c9b0vpEwN94/zv2OBHDnTiTjWPMv9Polmk+6tFYlCTuCE9k1Q2FmVo2t
         YXQe7Q5nuNy30JRha/35GhHYpYK1cVyC/qQKk8uRwZsebOTojYr2dm9CvUG9A2ADToiV
         lhfIWHON1CAxFxS65lyibK+RL7GiGP9zuxe7gse+WuJLqVJyWIBtP91Y4J+faDDC8LTI
         eRvA==
X-Forwarded-Encrypted: i=1; AJvYcCWQELc95x9QyyNMJ6FnIi8AfTw5Uw8LD5+rgV86CfKZv7P4NafbIGl1Nh+aYG+pJNEd53cD4Rj7io+h0xCYBFu/BTRah69TeYCZNwhdPBCC
X-Gm-Message-State: AOJu0YyMvfmLR7FZCV33ttnANuH57kc92Xtmgh1+qvTbYZHilaObahmf
	YAe/wIADhvEpWyio4GumhFTY5YZ5eZiPNs6NpsHkLhyZjijk3KSGWcAwBF0R
X-Google-Smtp-Source: AGHT+IG6C8VN/hr0ttcxI/kaGXlMakQv/tsuqecTawLJeBmAd209fd4TfWFAO4NPn4z9BveEx+9n0w==
X-Received: by 2002:a05:6a00:3d48:b0:6e6:1c12:513c with SMTP id lp8-20020a056a003d4800b006e61c12513cmr3040258pfb.34.1710017823939;
        Sat, 09 Mar 2024 12:57:03 -0800 (PST)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id fi10-20020a056a00398a00b006e6857da474sm347881pfb.178.2024.03.09.12.56.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 09 Mar 2024 12:57:03 -0800 (PST)
Subject: Re: spinlock recursion when running q800 emulation in qemu
To: Finn Thain <fthain@linux-m68k.org>
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net>
 <0ccf5e42-63ec-a63d-9ee9-7043947637c3@gmail.com>
 <40205038-a7cd-2568-5f8e-2540aca2f84d@linux-m68k.org>
 <56f79fc8-1a62-48af-b2fb-cddace7c828f@gmail.com>
 <60029130-022e-8ec7-2dc5-678b077f1d69@linux-m68k.org>
 <6eeccba7-6877-dd3c-2a67-94ea448bead6@gmail.com>
 <cb98b504-0669-eb91-4da0-8ee7bb7663ba@linux-m68k.org>
 <5076e848-9bd3-3fea-0aca-5f62a8739a73@linux-m68k.org>
 <bd6eb981-0dfe-a9c9-7777-0cfa0703efc0@gmail.com>
 <fbc5d581-dcad-8627-3a19-6e2d10614870@linux-m68k.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <2465c81d-d2dd-320e-cb4c-1c23fd485aed@gmail.com>
Date: Sun, 10 Mar 2024 09:56:55 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <fbc5d581-dcad-8627-3a19-6e2d10614870@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Finn,

Am 09.03.2024 um 18:02 schrieb Finn Thain:
>
> On Sat, 9 Mar 2024, Michael Schmitz wrote:
>
>>
>> I notice legacy_timer_tick() states it must be called with interrupts
>> disabled. We do not explicitly do that in via_timer_handler(), but rely
>> on the IPL remaining high. Maybe adding local_irq_save(flags) /
>> local_irq_restore(flags) around the legacy_timer_tick() call would help
>> debug this?
>>
>
> If legacy_timer_tick() is sensitive to execution context, why not test the
> IPL with an assertion? That way you can catch that problem on Aranym as
> well as Qemu.

Done that, and so far haven't seen the expected BUG message yet.

But I've now got this in ARAnyM:

BUG: spinlock recursion on CPU#0, pool_workqueue_/3
  lock: 0x435670, .magic: dead4ead, .owner: pool_workqueue_/3, .owner_cpu: 0
CPU: 0 PID: 3 Comm: pool_workqueue_ Not tainted 
6.8.0-rc7-atari-fpuemu-spinlocktest+ #1693
Stack from 00835eb4:
         00835eb4 003d5726 003d5726 00000000 0000000d 003273b0 003d5726 
0003a38a
         00435670 003cbec0 00840be0 000330f6 00435670 00814080 0003f5f2 
0004ca60
         00002604 0000714c 00000000 00000000 0003f666 0000000d 00000000 
00000000
         0032b7a6 0032b864 000186e6 00468958 004689b4 00000000 00000000 
0003f716
         00468958 00000000 00468958 0003f76e 00468958 004689b4 00468958 
004689b4
         00468958 00041c8e 00468958 00468958 0002dc58 00000000 0003f21c 
00468958
Call Trace: [<003273b0>] dump_stack+0xc/0x10
  [<0003a38a>] do_raw_spin_lock+0x34/0x58
  [<000330f6>] scheduler_tick+0x18/0x6e
  [<0003f5f2>] __irq_wake_thread+0x0/0x40
  [<0004ca60>] update_process_times+0x5e/0x66
  [<00002604>] trap+0x10/0x28
  [<0000714c>] mfp_timer_c_handler+0x2c/0x3c
  [<0003f666>] __handle_irq_event_percpu+0x34/0xd4
  [<0032b7a6>] _raw_spin_lock+0x0/0xe
  [<0032b864>] _raw_spin_unlock+0x0/0xe
  [<000186e6>] kernel_thread+0x0/0x6c
  [<0003f716>] handle_irq_event_percpu+0x10/0x3a
  [<0003f76e>] handle_irq_event+0x2e/0x54
  [<00041c8e>] handle_simple_irq+0x56/0x66
  [<0002dc58>] kthread+0x0/0xa6
  [<0003f21c>] handle_irq_desc+0x1e/0x28
  [<00002894>] do_IRQ+0x20/0x32
  [<000027c8>] user_irqvec_fixup+0xc/0x14
  [<0032b7a6>] _raw_spin_lock+0x0/0xe
  [<0032b864>] _raw_spin_unlock+0x0/0xe
  [<000186e6>] kernel_thread+0x0/0x6c
  [<0000262c>] ret_from_kernel_thread+0x0/0x14

RCU Tasks Trace: Setting shift to 0 and lim to 1 rcu_task_cb_adjust=1.

Happens real early during the boot process.

mfp_timer_c_hander() has a local_irq_save() / local_irq_restore() pair 
around the legacy_timer_tick() invocation so this spinlock recursion 
does appear to work even without reentering the scheduling timer routine ...

Cheers,

	Michael

