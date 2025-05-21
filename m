Received: from smtp.dnamail.fi (sender001.dnamail.fi [83.102.40.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D6E1754B
	for <linux-m68k@vger.kernel.org>; Wed, 21 May 2025 22:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.102.40.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747866067; cv=none; b=HM6FnlDsgjgtYgu99ZeHN23Iw3iUb+uZqip9gyBsbzumYNnThgG3LQJwgoqrJmnA3ym20Y0I538WW2uf/t4Hxk5no129ow+bkwmoLr7rktMzeBkOBwKMqfU0rajE8xqvMfORL4H1xLLcba3PK8VwCRkUHChnFdEB9fCssRsptB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747866067; c=relaxed/simple;
	bh=4zGpmT/rfbzGZWSEN4BOj5AAfkkBskvN4PMtA04Scdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z5W48/jwF6SeZ8niJednoHzKi5Q1fkbsfPwK6kujU+qh5Lh2edj/5XVxzjch3As9mPSrvOYl6x6qPZkBV8BPJitm5L3fgfnqFFuwOxehVBfmGPi1HKbWKyNGjNpUGEHQTaHmjFzKIPiYqyLHabIjlfXrm7QcWvZixQyU5wBpLP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=helsinkinet.fi; spf=pass smtp.mailfrom=helsinkinet.fi; dkim=pass (2048-bit key) header.d=helsinkinet.fi header.i=@helsinkinet.fi header.b=W+q8Oarb; arc=none smtp.client-ip=83.102.40.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=helsinkinet.fi header.i=@helsinkinet.fi header.b="W+q8Oarb"
Received: from localhost (localhost [127.0.0.1])
	by smtp.dnamail.fi (Postfix) with ESMTP id BEDDD2113E1A;
	Thu, 22 May 2025 01:14:25 +0300 (EEST)
X-Virus-Scanned: X-Virus-Scanned: amavis at smtp.dnamail.fi
Received: from smtp.dnamail.fi ([83.102.40.178])
 by localhost (dmail-psmtp01.s.dnaip.fi [127.0.0.1]) (amavis, port 10024)
 with ESMTP id lI8h2Qj7vyGn; Thu, 22 May 2025 01:14:25 +0300 (EEST)
Received: from [192.168.101.100] (78-27-104-28.bb.dnainternet.fi [78.27.104.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: oak@dnamail.internal)
	by smtp.dnamail.fi (Postfix) with ESMTPSA id BBB052113E15;
	Thu, 22 May 2025 01:14:19 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.dnamail.fi BBB052113E15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=helsinkinet.fi;
	s=2025-03; t=1747865665;
	bh=Fjt4K53mtitOEiWBMHgxnOFdR2p97ru+kRq5Ff+OFcs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W+q8OarbgzsX0/PqMYn1v9SOdNuHYGByZxOUlg2frVLNv7qp4sA1W+gRhuE0HDmKE
	 MBnS4V6kB0aP0hGZggJzmMDfczxaano74bCNug7gIyt8u/VykfD0vQ/0a56TUZuIFj
	 akBWRoOCQrcGJkPQEw0aFCFc0Qxx3KHH16QRcBiy7NJKs5pf41guTf9XUaJx237kVJ
	 QmA86Vh6d/CTNQmwYRwvtbDNkr0d3iqNPObPLBcBr32umLQ4VHmutklqrYAC5TbcCG
	 04yoC1i+JwtotfKV7ZA43D8fAQNM4bVcTnmluqMy02qEEn8Mhoea+CpT13UPmSxbsC
	 hY+ni+hwmi4Dw==
Message-ID: <176b883b-3097-427b-a554-5d88a7a95a1a@helsinkinet.fi>
Date: Thu, 22 May 2025 01:14:19 +0300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Debian subset suitable for m68k (was: Tuple and changes for m68k
 with -malign-int)
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: John Klos <john@klos.com>, debian-68k <debian-68k@lists.debian.org>,
 linux-m68k <linux-m68k@vger.kernel.org>
References: <0c84a202-2a7c-43c0-8d47-e73c0d9dc9ad@helsinkinet.fi>
 <F20746B7-7300-4967-8846-2D8BE287CEBC@physik.fu-berlin.de>
Content-Language: en-US
From: Eero Tamminen <oak@helsinkinet.fi>
In-Reply-To: <F20746B7-7300-4967-8846-2D8BE287CEBC@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 21.5.2025 20.54, John Paul Adrian Glaubitz wrote:
>> On May 21, 2025, at 4:16 PM, Eero Tamminen <oak@helsinkinet.fi> wrote:
>>
>> So to start, here are the things that are, and are not, relevant for me _on m68k_.  I.e. _personal_ opinions. First some general principles, and then few examples.
...
>> Any thoughts on the above principles?
> 
> The problem is that you assume that we can easily build and maintain a subset of Debian packages without investing a lot of time and effort.

I have no clue how that works, so my naive thought was that one could 
just supply some kind of a package name "skiplist", and builders would 
skip packages in that.

> However, I do not intend to maintain a custom version of Debian. I want to build the vanilla version of Debian unstable because I do neither have the time nor the resources to roll my own version of Debian.
 >
> And using vanilla Debian unstable means having to build all of these packages that you are trying to avoid because you think they’re bloated or useless.

The idea wasn't to customize Debian or its packages, just not (even try 
to) build some of the packages for the m68k package repo.

Is there some documentation on why it won't work?

---

Support for such list seems rather useful feature for the ports 
architectures, to skip packages that won't build as-is, or with trivial 
fixes, and for which nobody has declared interest (so that there would 
be a motive to fix non-trivial issues with them).

As to how that would work in practice, I would imagine that "skiplist" 
provided for builders would need to include also all packages that 
depend from given non-desirable package => there need to be some helper 
scripts to maintain it.

Those helper scripts could generate full "skiplist" from hand-maintained 
smaller one, add everything depending from them, and check that list 
against a hand-maintained whitelist, to verify that deps haven't changed 
so that a package that somebody actually wants to use on m68k, would be 
skipped.


> And, as for Rust, an increasing number of Python packages such as python-cryptography embed Rust code, so the decision whether we should support Rust or not has already been made.

Right, quite a lot of packages depends on that, and even more on Rusted 
librsvg2.

While package dependencies, especially build ones, can quickly get out 
of hand, scripting I discussed above, would help in pointing out all 
implications of dropping or including specific packages.  I.e. provide 
full facts for discussion on whether to drop or include specific (e.g. 
language) package for a m68k port subset.


	- Eero

