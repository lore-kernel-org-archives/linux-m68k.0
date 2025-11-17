Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EC926F46F
	for <linux-m68k@lists.linux-m68k.org>; Mon, 17 Nov 2025 17:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763401276; cv=none; b=aobDdX1/in5B+OdUUxDOHyeACdDkNVTfLeFEtEg6XiDS/eMciv15fxvmtX2gcCZWNqjya85mACydpHymuFXJcvVPDj4x5rhiDRLwhin7udPMKBWoY7gj3mFborcKfXRvusjdVCPupYztbPVsbnrS7KoKm2nteLou2TslVrhM2H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763401276; c=relaxed/simple;
	bh=IQR37DFv7yx5fqIMOTWawCv9iB1snRDPhdMn8bIi924=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=BXSuz34/ZDaWJj8ZNktrrc17oihQnkIvaSgC+y6UbmjOIjCmyL7cYFeYkIOEmxxm4+9F4eaaYYkCWcfQQkl9IeFPUdWpmce842il0bVHEcntz2vZsP9qFrMDQJzEbEl8d5ll2vSMK5aQJIoA+P3wXbwlABxAEReGIrF0bGcQxZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EymKeoBH; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EymKeoBH"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29586626fbeso47926725ad.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 17 Nov 2025 09:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763401274; x=1764006074; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlMWIkXFzN99+tDiJdcgUY/PwcJFNG7WEvBz69IWKk0=;
        b=EymKeoBHS1hKBSigXxQUWKIL9QFuQs5fTPJYQHaDT/U67mINgBScnJV2b9X79ZbA9d
         Ex1winJqotXCOF/OwLOQQvnWIziJHNCcOqeQ/zZtNMP8gpX/wrhMK2eDTGPf+uSil9d9
         Nn6FKeCT+QjdOkrPshzqSPLk/lGkqYTesi+qwzDceyjF3HB8mQJoD4dr5A1ZARCxy/Vg
         SztAF8YiXPcFOk3Bd2hx+Ff3y6wvoaJtQTK9zwRX8ub86jZ6r4JVTydOd+RU8JPBl/ss
         36LX2cnyGJG2u0LMPO8F1lBtNDcEf6rf2wz+8qZOzjsLCV+IFSZYIE3fRvcEW5JC0Mbe
         wpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763401274; x=1764006074;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vlMWIkXFzN99+tDiJdcgUY/PwcJFNG7WEvBz69IWKk0=;
        b=N4qRYamFHF3oTe/x6gu2w8R+7Fdm72NNbwjeQMZJNJ1tm48Amjxa/FGTdI+50y5pZi
         srRNEIM22OYNzCS9YQgRhflbg5I/ZTaaFbKkTtAjr5+39JpaHIVLKW5eAkqhMzPcB8g5
         /w/T1JA74Cr2GIFwwft6tW84VOyivHzw7BDjfhFc+Y2xwHJRRrw0BY4v4iH8Vi/kLILW
         16y9G97wFS1bq6H3PpZOmBBGTgBBBU059UhiZ3TZyoraKaqU78o+ZAQtk+bR+4lf8+K0
         sS9H7ZtOluGeB4lIANiuO7SPnkG4yDM2Z/eNSNNEgJuIvtgDoarmfPxxkAh3n96NAQ/T
         O1pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQXc4m5qGePW2auGswGQ4bcB+LGOluYfhO184z4IYc6xcW00ibl9T+XiCrMbZDdkLn6muc0hZeLd7m@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Ywx3czx6q3lJ8g4R5NmgzImeUulsXuKAvFuI+DbE8mRiOlSOClX
	bDL7MEEeKtY0nkLkvkg0P8VWe58+emcTVYhuxu5+8v2ESmIK+rD+TLa6
X-Gm-Gg: ASbGncugFoDnHtQlo/9xcZJtLhUs3Nb0TH4+GKMDefdelhVjx0Bt942QLexOEwewZ7I
	J5xh7lqYaeJb1zzmAGjp1CB2/bvWKt5ZSRjXpToBHTJFOH+nPtYDrWtg246IU376T7oeYjor2Wf
	nz1rlRwSFHZq+RabxThq3c3xmzTdJrPLtJmjXlxNi3YzTIdQRxJ+sHziP/Oi8ctpKIMOsKQ4MMf
	eEiJ99IEFGFxrxKpMFHx5kUBNE9gj7PEc6Y5ynQO2R8tK11KLFwq9nK4bFx/0LLeZeY/YJ8q6O4
	3l525/H7yqFCorPytEgui9IV6YwCYETjZSFQPQ36bcxcO6jJlcQD2VLvqIeVNzvV+g0Nht8Idg5
	iMbWKDYqohBHYfn5wchr8uvxkDgtcXqHTKo62VX0zOcNrqqe5v66aS9VYjDhoHT+SXgYrDcF5j/
	s0JJKl4Butpt+0jJG3M4XauP+OtnJ6ujnU7WvaIoZthffpj8NPDIGMpzOH
X-Google-Smtp-Source: AGHT+IHq3+Af8tJSSF1t9CimeYTAbNt1wG3a+p/AdZk+zMwZczibgdvip/AtnGTuuXJSADgTDiht6A==
X-Received: by 2002:a17:903:17c6:b0:295:1aa7:edf7 with SMTP id d9443c01a7336-2986a73ba63mr148739335ad.30.1763401274128;
        Mon, 17 Nov 2025 09:41:14 -0800 (PST)
Received: from [10.1.1.24] (222-152-219-123-adsl.sparkbb.co.nz. [222.152.219.123])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2986a60b116sm114206205ad.79.2025.11.17.09.41.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Nov 2025 09:41:13 -0800 (PST)
Subject: Re: [PATCH] m68k: Implement kernel memory protection
To: Daniel Palmer <daniel@thingy.jp>, Greg Ungerer <gerg@kernel.org>
References: <20251116220508.1513445-1-daniel@thingy.jp>
 <e5ff379e-b679-4513-b390-fa9b604999f4@kernel.org>
 <CAFr9PXkzhEEsSUXWCtpHaX6DWEKzX=xCESSpzbSFoJgf8mrz4A@mail.gmail.com>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <126822f3-6f11-d02d-43f8-1b5e6bcc910a@gmail.com>
Date: Tue, 18 Nov 2025 06:41:08 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAFr9PXkzhEEsSUXWCtpHaX6DWEKzX=xCESSpzbSFoJgf8mrz4A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Daniel,

take a look at arch/m68k/kernel/head.S - 030 MMU setup uses early 
termination descriptors for kernel memory, _not_ regular page tables.

Cheers,

	Michael


Am 17.11.2025 um 22:42 schrieb Daniel Palmer:
> Hi Greg,
>
> On Mon, 17 Nov 2025 at 12:04, Greg Ungerer <gerg@kernel.org> wrote:
>> Seems to work fine on real ColdFire hardware (tested on an M5475 -
>> that is one that has an MMU):
>
> Thanks for testing. I just tried on my MVME147 (030) and the marking
> RO seems to work but it locks up starting init:
>
> [    6.520000] devtmpfs: mounted
> [    6.540000] Freeing unused kernel image (initmem) memory: 120K
> [    6.550000] Write protecting kernel text: 0x2000 - 0x3676f0
> [    6.560000] Write protecting kernel read-only data: 0x36a000 - 0x3be000
> [    6.580000] rodata_test: all tests were successful
> [    6.590000] Run /sbin/init as init process
> <dead>
>
> My 060 Amiga 4000 seems ok. So I guess some 030 mmu issue. I'll debug
> and send again..
>
> Thanks!
>
> Daniel
>
