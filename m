Received: from smtp.dnamail.fi (sender001.dnamail.fi [83.102.40.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E17192B84
	for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 14:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.102.40.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749824130; cv=none; b=SEGoDgQf1uSvAwjhJqciw2tpjyTpf8AsvNmw2TyKF3jTS8n7h36ocFuheyKO6x8UYuM1h+Kp7GLBI9IJdHYZrYjjpVPrZ5kzLDLZnMdatkLh/vH9OspjSl2KgsLOsSsAV5PekxQzkZWC4FiDfbcyxU0heqbvYFDBtAibcyAcCns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749824130; c=relaxed/simple;
	bh=Mz1glk8haOa8hyPko1WYn6/8gjlDqmK1xbeDs5EuS6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rt/YAmHO1naxijtBgA4bcGY4lKw95AKnfKXcFUqyh7No3wctm5Wq30Nqh8jsmAkwc7fHqa0VtIUCxj2J01M/wnK93cIjr76ZEYlTXuK/wZBobCDqwcDXFJxsLXTOE4lKsNW7qqEA0Sq2WUhIcHvMeDQWjwQaW1bRgSbtKm+uWng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=helsinkinet.fi; spf=pass smtp.mailfrom=helsinkinet.fi; dkim=pass (2048-bit key) header.d=helsinkinet.fi header.i=@helsinkinet.fi header.b=fjybg7ku; arc=none smtp.client-ip=83.102.40.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=helsinkinet.fi header.i=@helsinkinet.fi header.b="fjybg7ku"
Received: from localhost (localhost [127.0.0.1])
	by smtp.dnamail.fi (Postfix) with ESMTP id F09882113E02;
	Fri, 13 Jun 2025 17:15:23 +0300 (EEST)
X-Virus-Scanned: X-Virus-Scanned: amavis at smtp.dnamail.fi
Received: from smtp.dnamail.fi ([83.102.40.178])
 by localhost (dmail-psmtp01.s.dnaip.fi [127.0.0.1]) (amavis, port 10024)
 with ESMTP id EVDp-j8Dyg8C; Fri, 13 Jun 2025 17:15:17 +0300 (EEST)
Received: from [192.168.101.100] (78-27-126-206.bb.dnainternet.fi [78.27.126.206])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: oak@dnamail.internal)
	by smtp.dnamail.fi (Postfix) with ESMTPSA id 63C562113E00;
	Fri, 13 Jun 2025 17:15:17 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.dnamail.fi 63C562113E00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=helsinkinet.fi;
	s=2025-03; t=1749824117;
	bh=6w8B+RYo7U2xbgeTKulNUgSmQpS/IhUndynomrkEkUk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fjybg7ku/5ohb24mteNm3BUrqxtsAK7zv3rllNA+g8rycDqecdGcaPXLnjY00Adyj
	 +TBGCvfFUDqmRgeWcnKp2+ZM77FBNrzFqUyhTRqjq15z1N9WYtox63j8503XphN/8Y
	 OBD8j3D9/AgSLUHPEoN0XHbZH0a/jKQF2DbutA5DmyovdaHzPP+hstW96MU/tu1Oq3
	 KO85XZ2Pw1MBbQYuI4M5oxzs2G8+VX7uTDPEhqXTOpQC4bdeiEo9AUrkDBQ4utb/et
	 TAtLO3Bw488QiLBnYxvaduvIDZMc8yX+YYdLQZnJAGDgHrGgg3ESx9wyqMzdqcaxtD
	 3kh54bfT2dPQA==
Message-ID: <569d73fb-8ad5-46f0-bf4c-568919f319e7@helsinkinet.fi>
Date: Fri, 13 Jun 2025 17:15:16 +0300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>,
 linux-m68k <linux-m68k@vger.kernel.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>
 <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>
 <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
 <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>
 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
 <CAMuHMdUACa7Z-BV077H+G0Hd=mTBqLw7VdshbYCixeVtsuHYeg@mail.gmail.com>
 <6e6f8e27ff90ce3f8535fc4f5c57049c59a9b227.camel@physik.fu-berlin.de>
 <CAMuHMdWFb2kBpEBV3PQuwyCoCDBsANZobTSccrEog7j_dcBF2Q@mail.gmail.com>
 <49a62eda6aea856df248aa223365b5230020d829.camel@physik.fu-berlin.de>
 <CAMuHMdVFrrtMkn1LSV0t0Yxed1uiyjmovu=P9jfz8jWJViNNHQ@mail.gmail.com>
 <ddef536e0645c9d7cebfd829837af653da50afaa.camel@physik.fu-berlin.de>
Content-Language: en-US
From: Eero Tamminen <oak@helsinkinet.fi>
In-Reply-To: <ddef536e0645c9d7cebfd829837af653da50afaa.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13.6.2025 15.51, John Paul Adrian Glaubitz wrote:
> On Fri, 2025-06-13 at 14:30 +0200, Geert Uytterhoeven wrote:
>> So you change the default alignment, bump all so-versions in userspace,
>> but keep the kernel-userspace ABI the same by adding explicit alignment
>> tags where needed? Old binaries keep on working, new binaries join
>> the ecosystem of anything that still builds on 32-bit big-endian ;-)
> 
> I think you're still missing the part that I'm not maintaining my own Linux
> distribution meaning that I cannot bump SO versions or making any substantial
> changes to the distributions.>
> And I'm not sure why being able to run old binaries on a retro-computing architecture
> is is so important for some people that they think it justifies making my life
> miserable.

Wouldn't next upgrade completely break user's Debian system so it needs 
complete re-install?

If true, would separate m68k arch for 4-byte alignment be out of 
question, similarly how there have been different ARM arch variants?


	- Eero

PS. I was peripherally involved in the ARM VFP thing, in a Debian 
derivative that switched to use VFP before Debian did. So I know a bit 
how big thing such transition is, even with the Debian cross-compiling & 
boot-strapping support being much better now...
