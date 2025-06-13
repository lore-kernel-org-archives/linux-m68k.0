Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413251F03DE
	for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 15:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749829812; cv=none; b=HBM7rQjcmugmoiEmRLroZKjL7K0+vha7k/V7sk7f5ItnUThoJIUCuKRUTc5Kxhl74zYzaKCcyigewRGU9htNUYHzdXOlI+J3mpazj3OnlPtIsWPg/UNJS2z1xuQ+tofRScKOmtl2sCwp0PcZjyocm6zkoWDSeqw3fqvPS6limRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749829812; c=relaxed/simple;
	bh=cPJg90h5H1mjiDsH3UAcu160rpQ+pFkKs7x6yHsafMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oMV02oXI71Zvqf9+DTS4iKIiIhduB2pO19XVxMohOFF4fiyj/Gs9uacsr6bOS6gjL8vO2dTbacpCgGeXpU6QFZkFxhRw5h38bLTM20NrChCULEV5zG401r0HaY9xl8GBoR3SRz1QBm2mqG1ihcTHT6YjCoxCANTU68oSUpq1CiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vivier.eu; spf=pass smtp.mailfrom=vivier.eu; arc=none smtp.client-ip=212.227.126.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vivier.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivier.eu
Received: from [192.168.100.1] ([82.64.211.94]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MYvoW-1uLgQR071M-00NCh8; Fri, 13 Jun 2025 17:24:39 +0200
Message-ID: <022ab204-7be9-4f6a-a92f-2601fae1f146@vivier.eu>
Date: Fri, 13 Jun 2025 17:24:38 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Eero Tamminen <oak@helsinkinet.fi>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>,
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
 <CAMuHMdUACa7Z-BV077H+G0Hd=mTBqLw7VdshbYCixeVtsuHYeg@mail.gmail.com>
 <6e6f8e27ff90ce3f8535fc4f5c57049c59a9b227.camel@physik.fu-berlin.de>
 <CAMuHMdWFb2kBpEBV3PQuwyCoCDBsANZobTSccrEog7j_dcBF2Q@mail.gmail.com>
 <49a62eda6aea856df248aa223365b5230020d829.camel@physik.fu-berlin.de>
 <CAMuHMdVFrrtMkn1LSV0t0Yxed1uiyjmovu=P9jfz8jWJViNNHQ@mail.gmail.com>
 <ddef536e0645c9d7cebfd829837af653da50afaa.camel@physik.fu-berlin.de>
 <569d73fb-8ad5-46f0-bf4c-568919f319e7@helsinkinet.fi>
 <b2f74ffcd4c4a8aef248c21cd6deafcb92d86d37.camel@physik.fu-berlin.de>
Content-Language: en-US, fr-FR
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <b2f74ffcd4c4a8aef248c21cd6deafcb92d86d37.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GLouXttFuZRG4pa19Hj/k1DUOPH8ih4A20i+Kyn7enbCEMsWzR2
 5rWaQBE8QRfytMvuuzEzUlItTg6EIYPm8VGATq2QoxvmU+8lA2IU3aGciaB13cwBIWvwr12
 epzBfBH82UmN95ibDl8k5vqDIge7g7rKfsmlNy8cVfdl2Jk+S/rnhKg+tv1CIjToQNbtwI+
 BUprWULxw6MfY/WBT95TQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:014rbViEbCE=;bqS1D+QrWGdQFxcNG51LBBtC6Y0
 MB41KwDJAOa5dDfxXadMsfVSTmKmU/BjYYGiaw9lnyrECznTQAIqbcCjvnE+V/ayChdlpJDiD
 t336SYiB1niMC0+988u4Z0R9jb/OUUwaiMtjetffy1Kbw8g9i5VjD/VxpNiwphYZln6HbE7wc
 HGc0h9q2+0yaWrpXho+RflokCwGaOiSYH+5+FgKvjcyTpnHgXPI3OSrhUlMZhhfZr2HvaQBIu
 aIz0G35T/pMxvwGYWuSZb9PwD8yudFzF6EJ/P3TqP4SUwtJWLhcS2muVrL87t0pwdCMLQyyH1
 zZ4k98/cSx2zjd+l3Ot8xrLn2ObFUHD/cDmrYRHsGAwT3JyMft/k2PyEjaxA0en3hhgByXN+R
 /wruflQINKYIKW+HnKh8KGNovKcB1Oi5VnylugIRzdTxfHmOSZlXGPjP2TMbsx96WZL1YBvZO
 Eux/asnI8c8aCz7r6jy2uvcmPhgBEuzBdzdEj/QgkjW7zqBnX7xYkjs1tkDlaLVJGQmD/G2oK
 nmEZslRX9vy/ez1M6OKIR2t3ndAXaqA5mtqPfZuBi2ZNdwryioQNlE+KFdwl4+4PVc0qkPOBF
 kYfIaRJTV4w6F5ZCC+OLoJ4gmeSGisDeEKbepe2Ogqmzkl/AjylT85tuSxp4EFXB6Qf8ZpU8k
 JKzB44x/5ki94Hg4UR/J5CIwddIEf6N4MsqtPgLTifkLZZ4HZm0eq44FofJ1SotfX+L4bF7J7
 XrszeYsJHmB/kjrpW1qjWqZVbit0o/r5538nYCnm30DS4f6IQ2fDnv5hPBZnqLvP1uVmoUMch
 lu1NS0WdOHTa4167LCq0/npWRVGoE7tAs59CtyKF43ALMb9yAUSdFui6cVukFApimVqF1Azjy
 ZaMxPG1+CX2exmhPc6f0Xgz7o09pn5JzTvwc7w/D4y/YNrLuru8s4cv7EEzV5y/pOcWIG6i/y
 BHTwbmT4CJuwkSZwPtAH9zfpYOlRHIBGyEEpeIq2nlkM5+d4T2/eReg0UQ+OGjuPgdeE6YVhB
 2G16VYSyuiNabVhLNgxlTbXEGFEuCYb6bAHqnNCSA4jMUudc4amUvzxQTw+AJ2YYsr2JgZMcJ
 LPbIWK64oGZIELaP/pNfytm78EAGsrsgrmEyVvD1uEmE4kc9kBzYtMlh647kjRVQu0M7rTJK6
 1ahLwMmq8yNr/g9FgGYgFqyh5OHvW6Wd0bzZHW3LpTQ48GQgDbpMSJXxR4ueoR2alRQx9iPaY
 G4bYcmje6hoc/SulSoPjA+4ImDgU3VTmfUNAP5FbPKZ9y9Vk3x+4mgBCbeoNXUbKmJcN3qkCx
 +AHExK+lfxy9gTsil5U+7mp3aE+QR/lVyJwEW+gHV4cRMYyycVmaiCb4AP1mHcb3o6VkXugRZ
 uyjdQ4hFU+ycJ/aTI7FHjY6NBp1ym6kf6ON7A=



Hi Adrian,

Le 13/06/2025 à 16:53, John Paul Adrian Glaubitz a écrit :

> On Fri, 2025-06-13 at 17:15 +0300, Eero Tamminen wrote:
>> Wouldn't next upgrade completely break user's Debian system so it needs
>> complete re-install?
> 
> You would need to extract the glibc package manually from my tests. After that,
> upgrading the system should be possible.
> 
>> If true, would separate m68k arch for 4-byte alignment be out of
>> question, similarly how there have been different ARM arch variants?
> 
> Creating a separate arch would mean patching various parts of Debian which
> again would involve a lot of work which I don't think is worth the effort.
> 
> I don't think the userbase is large enough to warrant all that work.
> 
>> PS. I was peripherally involved in the ARM VFP thing, in a Debian
>> derivative that switched to use VFP before Debian did. So I know a bit
>> how big thing such transition is, even with the Debian cross-compiling &
>> boot-strapping support being much better now...
> 
> That's why I want to make a hard cut and not invest months of work when the
> userbase consists of just a few people.
> 

A stupid question: is this possible to remove from debian the packets 
that are broken?
(I'm sorry if you already answered to this question).

Because I'm afraid that changing the ABI could cause more problems than 
it solves.

Thanks,
Laurent

