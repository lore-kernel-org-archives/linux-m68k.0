Received: from smtp.dnamail.fi (sender001.dnamail.fi [83.102.40.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6522F2C15A5
	for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 11:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.102.40.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749812768; cv=none; b=OOQ6wwywbtur8M2HHa3YrXUA5L8WczI9xHjT3TRCsOnCRM9FxGZQobPDeEypkMojWQ8YXmbWAFFdRF2SvjAuQqLmyioaaC7cW6DrWcujoOfDhB/xY5Iqxymp8kzWyA+vzSBZXv/UqNr67O+rUkyLook3h6gZWniFl1nIn4bvZBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749812768; c=relaxed/simple;
	bh=c1aeh5W1t80PKXhKzKh0Ox8hgoMTrFABYTp73GMFnps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ekp1El1EBm/MELFTrkohk8N0rGjyGSyavIB+z0//0jsdxZYvK7Y65ZGboU8tNqJC3edXKpZ5iDj0Hy2zElEpWxwOkO9s9fLJpYl1eLNfsduF8+LsiZHtf+NOozOFMuca2s4ZxQfdHSZ/uAv32W4vjtLV3ubCU9IdhsW5IpH777s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=helsinkinet.fi; spf=pass smtp.mailfrom=helsinkinet.fi; dkim=pass (2048-bit key) header.d=helsinkinet.fi header.i=@helsinkinet.fi header.b=CwF9hjSM; arc=none smtp.client-ip=83.102.40.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=helsinkinet.fi header.i=@helsinkinet.fi header.b="CwF9hjSM"
Received: from localhost (localhost [127.0.0.1])
	by smtp.dnamail.fi (Postfix) with ESMTP id 0FBF42113E0E;
	Fri, 13 Jun 2025 13:56:31 +0300 (EEST)
X-Virus-Scanned: X-Virus-Scanned: amavis at smtp.dnamail.fi
Received: from smtp.dnamail.fi ([83.102.40.178])
 by localhost (dmail-psmtp01.s.dnaip.fi [127.0.0.1]) (amavis, port 10024)
 with ESMTP id fmYlJ63ZMWsf; Fri, 13 Jun 2025 13:56:30 +0300 (EEST)
Received: from [192.168.101.100] (78-27-126-206.bb.dnainternet.fi [78.27.126.206])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: oak@dnamail.internal)
	by smtp.dnamail.fi (Postfix) with ESMTPSA id 434872113E05;
	Fri, 13 Jun 2025 13:56:30 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.dnamail.fi 434872113E05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=helsinkinet.fi;
	s=2025-03; t=1749812190;
	bh=R8l1LcsRIISW5O1VhKRFXuF/ahe4taK7siE6qDjysBw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CwF9hjSM6dUyAHyCTF6aPLeFumV6k68Ywema5mrCNwsY4gcUZGpd+Kp+04pMgvLKv
	 CXD4LkX1eYyzXhVf27lz3gj+SMIHV6TfXm0dr+3lAmF3ryEEuV6iDaYmXb4h2z/6FM
	 OrqqOd9kD3vIX6xHE/AaIOlFE9YP42882X35g/Z1bBHIkoz3uE0tqu3+HN8Dm6bRGd
	 aUHyaWvib/30VMVBl63KZt2oVXQ7g/aT5DWhVTIOa+x3YgHHQIxKNAuOLua6pYwtfj
	 rZve7CJDcXumam+L2h9YVDhI/HfhrK2LRvL/57H2DEVGur3jxZKBQAP1pJNQla/Mlt
	 iSgQDfsnvfr7A==
Message-ID: <241380f5-6c75-423e-829b-400161b020bc@helsinkinet.fi>
Date: Fri, 13 Jun 2025 13:56:29 +0300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: Finn Thain <fthain@linux-m68k.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Stan Johnson <userm57@yahoo.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>,
 linux-m68k <linux-m68k@vger.kernel.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>
 <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
 <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>
 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
 <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org>
 <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de>
 <0d7b5c87-f0f7-70a4-cf75-5147e67904da@yahoo.com>
 <131b33a26efd2b0e21dfee784821dcaf3aeddad4.camel@physik.fu-berlin.de>
 <6a50c81a-cb0c-4529-959a-fad5260261fc@helsinkinet.fi>
 <ea1aecf0f20b5466f63b3c6e671d1d29c81dfd87.camel@physik.fu-berlin.de>
 <243529d0-daac-48b9-b482-04e3ed2f66f0@helsinkinet.fi>
 <d3a8ab8a-3be5-8f04-8b7c-07ff7e103e35@linux-m68k.org>
Content-Language: en-US
From: Eero Tamminen <oak@helsinkinet.fi>
In-Reply-To: <d3a8ab8a-3be5-8f04-8b7c-07ff7e103e35@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13.6.2025 4.36, Finn Thain wrote:
> And therein lies the rub -- to identify those workloads which should be
> measured and to afford each one a suitable weight in your decision making.

It's not just workload affecting the results; compiler version, 
optimization options [1], workload & kernel config options and sometimes 
even unrelated code changes [2], can affect how given instruction 
sequence settles into cache.


 > That's why this was always political.

I'd rather keep things technical and fact-based.

Whatever testing is done, the one wider conclusion that *can* be drawn 
from it, is that if there's a noticeable performance difference, such 
differences are possible also in other workloads.

(Very large difference could indicate also functional issues, e.g. bug 
in given compiler build code generation.  That's why it's important to 
have good tooling for pinpointing what exactly is causing the difference.)


	- Eero

[1] One example is -Os vs. -O2 having 2x perf impact on Geert's 
experimental Atari drm fb code.  That would completely hide any impact 
from alignment.

[2] with more complex cache hierarchies than on m68k, adding or removing 
code elsewhere can impact cache line alignment on other parts of the 
resulting binary.  Not a concern for m68k though.
