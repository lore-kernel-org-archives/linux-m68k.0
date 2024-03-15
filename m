Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD7DDDA9
	for <linux-m68k@lists.linux-m68k.org>; Fri, 15 Mar 2024 04:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710477176; cv=none; b=a7yNy/3LAtyZOpWTupztBy5a8PgHYSG3lbCh+s/+u6MXwoltCdKVC1xUz7+lUbN7Dc3J/LpZa1tOtgTQHmdsIzHsYOYely5s3Nvk5vb3WEcZRYiS2G42O/ZnwkbYd6hpwHaccRO+s/0VluIf7mYVMMuJA1IGu7+48x+nZrkwulA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710477176; c=relaxed/simple;
	bh=KL5Ega59DQwhILr//OjgsVRbcZa4iFw1ckRl+Hox/Y8=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Rr4xAvFg7UQzPh+pb8E6sFKEBvN2AudoxDPa47dsGG/VYgPDm02mCxY9zFzUSfNCygnw5oMosHcNq0HC32kflh2+HnlzYUrfYiOE8Lo2D9FBx40BLmg7N0IpxvawmVZp6eiqYbr0UoVExqlXO3xSy//buman+xpJ77KBwMcYg58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKzyInL6; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKzyInL6"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e6b5aa0b52so1528341b3a.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 14 Mar 2024 21:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710477174; x=1711081974; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+a/tVuzfNiUHyImtz2NJGR+UkaEg8BVmDPOU4S/AZ4=;
        b=gKzyInL6ncZZ3PdIpjr9j2iBDTpQNiPa1/yhQRjx3Q7fCUyf8BDDKLs3MRLoH8uOP3
         5uGyXdVFLZkz9+FuklRGYAB5/fhMXJNM2zAMs31cluMbTatydQ6/xH6px9i/nJbOMJH5
         toiUnu3q8SvWWmrXnrFbuGvj8K7VNAgcBufQoa1ey22rfq5b2lQg9SiCBKRlECnWjFNL
         QdkO7bRNgVbmafp/sFZON3U0f+Hm6dCIkzl4ab8kXLIvdoRq4o608R0t+jliBx9eCdSg
         yQsPZ0/vVPmOloN5lxUyU2Tz+N+ubpUIiz5d+/fmpEoDLgk89VL71DmTIEAIqsBKzQw4
         kekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710477174; x=1711081974;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W+a/tVuzfNiUHyImtz2NJGR+UkaEg8BVmDPOU4S/AZ4=;
        b=SoPBb7e8ZIGdnfksVMDPDT3Xot85XNgkB2SrmZhYqK4D9Plu5tBst5BKq64tbWUS0Z
         PqO911ra8mjGQEG67oDQwZ2P9XAu0xttLJafKaeGT3UDG8UoILz3j4bZB9OUqcoEvTRo
         Hy2xkGKlBJ1N7bN9nj7o4kh1cFjZjdiu3mFyekyydi6XNH8lPnYsqPQp0Iv1B+dfBt7g
         rXqNi2ZnNGcSvCNaOd4v+Ne7GR11P1jERZyLfXCxRVgzPfZr57fv79WKMCDfIJ99r6ZY
         q9UpB3fF/BgQCow2x+k6piLGXYscUsyD/8OaoloApVNeDRfeTZ/kSq+CZcGNmzsId1hQ
         yM3g==
X-Forwarded-Encrypted: i=1; AJvYcCXvpv+jCmDcpNC3zHlsPsO/b5wCnZKa7OxA4WOCy6/uE+agPQCWdAV/rylU9ngn/28u1Bc0kih7gtlO8jPNqZ+w7QDG3Onb0T7mde3Uzp2J
X-Gm-Message-State: AOJu0Yw26yN8Tk6T17dLbNPa5nYUxuLk5kixickgsu9kkaKlruxoMpHO
	PhjWy3TFdCgkEpL7WnJ+apFQULk3b+B0uHPphGWsZl68A+V+Pt3wn6O420Jx
X-Google-Smtp-Source: AGHT+IHiR/eqkBapoDCViWVq1fu4JDLEdfTPPAKqAtDreH8BOe5qfgUroCOfHsnA4kgrC7L2SMuSJg==
X-Received: by 2002:a05:6a20:748c:b0:1a3:4e2d:c0b8 with SMTP id p12-20020a056a20748c00b001a34e2dc0b8mr420624pzd.56.1710477173720;
        Thu, 14 Mar 2024 21:32:53 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id d9-20020a17090a498900b0029bc319f7c9sm1806197pjh.39.2024.03.14.21.32.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Mar 2024 21:32:53 -0700 (PDT)
Subject: Re: spinlock recursion when running q800 emulation in qemu
To: Finn Thain <fthain@linux-m68k.org>
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net>
 <40205038-a7cd-2568-5f8e-2540aca2f84d@linux-m68k.org>
 <56f79fc8-1a62-48af-b2fb-cddace7c828f@gmail.com>
 <60029130-022e-8ec7-2dc5-678b077f1d69@linux-m68k.org>
 <6eeccba7-6877-dd3c-2a67-94ea448bead6@gmail.com>
 <cb98b504-0669-eb91-4da0-8ee7bb7663ba@linux-m68k.org>
 <5076e848-9bd3-3fea-0aca-5f62a8739a73@linux-m68k.org>
 <bd6eb981-0dfe-a9c9-7777-0cfa0703efc0@gmail.com>
 <fbc5d581-dcad-8627-3a19-6e2d10614870@linux-m68k.org>
 <2465c81d-d2dd-320e-cb4c-1c23fd485aed@gmail.com>
 <9e5ce055-8af4-4cca-3505-a3186b86926d@linux-m68k.org>
 <ad9a7be6-e2f4-f17b-04fe-393a409e523d@gmail.com>
 <745f844f-a100-5f38-99b3-97ace157b2a2@linux-m68k.org>
 <afcd0605-49e4-49c6-90a3-2d5b6a2cbf78@gmail.com>
 <CAMuHMdX-4kPgg99k7VJhnHNKp2F2w9+gStyvKnrDwB0NTm5EqA@mail.gmail.com>
 <0c7b96d2-1cf1-4fc1-876e-8e3bc859a1c5@gmail.com>
 <028f8edc-a08f-571a-0985-275394b60986@linux-m68k.org>
 <7d28d5ee-176a-49de-a93c-76e03913cd8a@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <45c98c27-6839-7e11-9cde-c9a1805234f5@gmail.com>
Date: Fri, 15 Mar 2024 17:32:47 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <7d28d5ee-176a-49de-a93c-76e03913cd8a@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Finn, Geert,

Am 14.03.2024 um 13:59 schrieb Michael Schmitz:
> Hi Finn,
>
> On 13/03/24 17:40, Finn Thain wrote:
>> On Wed, 13 Mar 2024, Michael Schmitz wrote:
>>
>>> Running a stack-ng stack-fill stressor triggered the panic, too. I'll
>>> see how reliable that is.
>>>
>> I see an immediate failure with full preemption in QEMU when I run
>> stress-ng -t 60 --zombie -1
>
> Seems to work quite well.
>
> Though what I got on the first attempt was a deadlock with full
> preemption in ARAnyM. No panic.
>
> Time to look for a solution now we've got a nice test case.

No luck with whatever I tried around signals, cache maintenance and mm.

The 'BUG: Bad rss-counter state' message suggests we're freeing the same 
page ranges twice, sometimes in many cases. I cannot quite see how 
preempting the kernel on interupt return would cause this. Signal 
forcing process exit but process exiting before signal is received due 
to preemption? But skipping preemption when a signal is pending did not 
change anything in my tests...

Running out of ideas here, sorry.

Cheers,

	Michael


>
> Cheers,
>
>     Michael
>
>
>
