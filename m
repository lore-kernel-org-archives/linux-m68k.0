Received: from anath.zia.io (anath.zia.io [192.80.49.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534101DF27D
	for <linux-m68k@vger.kernel.org>; Sat,  7 Jun 2025 15:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.80.49.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749311831; cv=none; b=Ym+HCpwX1tWo4ith485/on9PXgoL4fdUisQ9kAOfYnT7eviJytBeLX2OtLfqAQeUPXBloLxfjGWTbN7dnu7DxH+FthTWMlZ/n72mKGfDsutyNGvmh7b+dvMqO+kgq4Ik29Wppnro9qtUP0FjFZEft6xwBqxr0DM/3Kp1lILRloA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749311831; c=relaxed/simple;
	bh=ehkwq8dYmW05aToD/ez8L/RMZ7wlUCCxsG01DJ4r4h8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hEw4eWo4daAefRRGrtZvd7Lg0KL4ES0P7U+26dB7Dw8KNqXLQzU1gOMPAnXLd1H5EIH+dPN+J12K9q/0y1hGaJgAC31BnG3cq2cdYus6DoeziW6JBvwCaGnABVmclhP77eu66UICGO2t+REXPHjBjokK9VgI6ghvYJcFCDC46rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=klos.com; spf=pass smtp.mailfrom=klos.com; arc=none smtp.client-ip=192.80.49.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=klos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=klos.com
Received: from daisy.zia.io (daisy.zia.io [IPv6:2001:1890:1bb7:b400:0:da:15:4])
	by anath.zia.io (8.18.1/8.16.1) with ESMTPS id 557Fp7JI009719
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-m68k@vger.kernel.org>; Sat, 7 Jun 2025 15:51:13 GMT
Received: from daisy.zia.io (localhost [127.0.0.1])
	by daisy.zia.io (8.18.1/8.18.1) with ESMTPS id 557Fp14L011078
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 7 Jun 2025 15:51:02 GMT
Received: from localhost (john@localhost)
	by daisy.zia.io (8.18.1/8.18.1/Submit) with ESMTP id 557Fp1DE013220;
	Sat, 7 Jun 2025 15:51:01 GMT
Date: Sat, 7 Jun 2025 15:51:01 +0000 (UTC)
From: John Klos <john@klos.com>
To: Andreas Schwab <schwab@linux-m68k.org>
cc: port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
In-Reply-To: <87tt4r8sws.fsf@igel.home>
Message-ID: <90e28887-5d87-b911-c4fc-8f2484bc356d@daisy.zia.io>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de> <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de> <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org> <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com> <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de> <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org> <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
 <87sekbq3f8.fsf@linux-m68k.org> <2bd7d3370101b73288f9a1cd1b6eed0ba0da700e.camel@physik.fu-berlin.de> <87cybfaa74.fsf@igel.home> <cca30c2641b40815e58add6bebee3178896666a4.camel@physik.fu-berlin.de> <875xh7a91r.fsf@igel.home>
 <1483007ddfcb164a5b1a5ccfcc053965af1a56bd.camel@physik.fu-berlin.de> <871prva88s.fsf@igel.home> <2eb555796aaa51267c0d2c88ad890b72f6684b94.camel@physik.fu-berlin.de> <87tt4r8sws.fsf@igel.home>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4 (anath.zia.io [IPv6:2604:7c00:23:5:ff71:c3ae:58d8:ecb8]); Sat, 07 Jun 2025 15:51:13 +0000 (UTC)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4 (daisy.zia.io [0.0.0.0]); Sat, 07 Jun 2025 15:51:02 +0000 (UTC)

>> It was very obviously your decision to use 2 byte alignment even though it
>> was against the official SVR4 ABI ;-).
>
> No, I followed the official ABI.

People here are clearly talking about the Unix SVR4 ABI. It's not clever 
to start talking about the Linux ABI without saying you're now talking 
about something other than what everyone else was talking about.

I've suggested rolling this in to the ABI change that'll address Y2038. I 
think, although you're not abundantly clear, that you advocate for that 
change to not be made, too. Is that the case? Should Linux/m68k just 
have the wrong time after 2038? Please be clear.

If you think that change is OK, then is there good technical reasoning you 
can think of to not roll this change in at the same time?

John
