Received: from anath.zia.io (anath.zia.io [192.80.49.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDC3224CC
	for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 13:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.80.49.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749820890; cv=none; b=nJLAUznqdd7cMhS0KxYt38JNlpbCLwf2FS1K1e7fhztQt2aqJM2RvA/6KVbNBAQz6pghFlrl5bwvXvFTw09j1t7VHsD8NFohYQpAlJHejwHIXXFmxh4/iXpYTZ60zudNWYvH+4Rsh0FCdBkZQIk4vGOgDytfQXaRCB/qq+E7Gi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749820890; c=relaxed/simple;
	bh=/7XY7d1rAhQixzsnIvlIV3YWSCMSH3Do4v3NOrVuB2U=;
	h=Date:From:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FLk39Kigil6WRHtu3iDH3nRXd1aXjiyyaTevVogCeLvqkka/n2qEhfRfGJh1bN4Oc7VxlOst4ARvTDoYT2YeUjDbhIoeHppKsn8hriuil2WDwzLz1yGmKpSop7+3hpoxuGJfLFlTXsfVgjIpv4HFQrXeTWR/fTPSzbX1dBv56FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=klos.com; spf=pass smtp.mailfrom=klos.com; arc=none smtp.client-ip=192.80.49.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=klos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=klos.com
Received: from daisy.zia.io (daisy.zia.io [IPv6:2001:1890:1bb7:b400:0:da:15:4])
	by anath.zia.io (8.18.1/8.16.1) with ESMTPS id 55DDLFk6003357
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 13:21:20 GMT
Received: from daisy.zia.io (localhost [127.0.0.1])
	by daisy.zia.io (8.18.1/8.18.1) with ESMTPS id 55DDL9D9018893
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 13:21:09 GMT
Received: from localhost (john@localhost)
	by daisy.zia.io (8.18.1/8.18.1/Submit) with ESMTP id 55DDL9nW029518;
	Fri, 13 Jun 2025 13:21:09 GMT
Date: Fri, 13 Jun 2025 13:21:09 +0000 (UTC)
From: John Klos <john@klos.com>
cc: port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
In-Reply-To: <6c9b49aaab26bd7fda7a95e7e0c5392b26abbcb4.camel@physik.fu-berlin.de>
Message-ID: <d6a5e25c-70bc-a7a2-1512-c7059c092f72@daisy.zia.io>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>  <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>  <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>  <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org> 
 <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>  <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>  <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>  <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>
  <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>  <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org>  <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de>  <0d7b5c87-f0f7-70a4-cf75-5147e67904da@yahoo.com> 
 <131b33a26efd2b0e21dfee784821dcaf3aeddad4.camel@physik.fu-berlin.de>  <6a50c81a-cb0c-4529-959a-fad5260261fc@helsinkinet.fi>  <ea1aecf0f20b5466f63b3c6e671d1d29c81dfd87.camel@physik.fu-berlin.de>  <243529d0-daac-48b9-b482-04e3ed2f66f0@helsinkinet.fi>
 <6c9b49aaab26bd7fda7a95e7e0c5392b26abbcb4.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4 (daisy.zia.io [0.0.0.0]); Fri, 13 Jun 2025 13:21:09 +0000 (UTC)

Hi,

> You're not offering help. You, like Finn as well, are trying to block fixing
> a long-standing problem of Linux/m68k without offering any sustainable alternatives
> to fix this problem.

I didn't see anywhere that Eero was blocking or hinting at blocking. I 
only saw Eero offering to collect data, which I think is a good idea.

It might not be directly relevant to the issue at hand, but we shouldn't 
say no to more information that might inform these changes, either for 
better or for worse.

John
