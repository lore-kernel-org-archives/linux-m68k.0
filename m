Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FE020D4F8
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 09:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750065023; cv=none; b=lFvRZE6/BkTnh3mbeohqc5WPIS5+DABxaFfhGyyVmFix9guBab3jAPxYsODLz5C5IppC4jyN+YJhRP3cNLNi3mhdixI9Pn9H6aOY9IhXPBe1n1roSYHC5gi5mZXXa66Xy7g7PLXEm31ArnlhC3lhULpFHJwaBNc97tDCIrkXWN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750065023; c=relaxed/simple;
	bh=GKmyICiNw23m3Ons6Wh8UHdhUxvXHNyp+ZHThgKd2UU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NBGTA/rD1RdDwKJqs2U1F72nuLKlejVcsbYIYOJRo9v6vk5vRAiqIww/M/mJFOZYuHIzvoS1m4pup50zQyEPj4Eift/p4U+OKVZhTctenbiWlsVNa0alAF1/7KK3BEr5IiTew/huSn4H5CpoUClF74YSlKiY3IoFrOaQ8Tv72oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vivier.eu; spf=pass smtp.mailfrom=vivier.eu; arc=none smtp.client-ip=212.227.126.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vivier.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivier.eu
Received: from [192.168.100.1] ([82.64.211.94]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N6bTa-1urpzz34vu-010Wnv; Mon, 16 Jun 2025 11:10:17 +0200
Message-ID: <7a80e6f1-1ac8-4082-b37f-f577ca0bdd5d@vivier.eu>
Date: Mon, 16 Jun 2025 11:10:17 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: port-m68k <port-m68k@netbsd.org>, debian-68k
 <debian-68k@lists.debian.org>, linux-m68k <linux-m68k@vger.kernel.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <CAMuHMdWFb2kBpEBV3PQuwyCoCDBsANZobTSccrEog7j_dcBF2Q@mail.gmail.com>
 <49a62eda6aea856df248aa223365b5230020d829.camel@physik.fu-berlin.de>
 <CAMuHMdVFrrtMkn1LSV0t0Yxed1uiyjmovu=P9jfz8jWJViNNHQ@mail.gmail.com>
 <ddef536e0645c9d7cebfd829837af653da50afaa.camel@physik.fu-berlin.de>
 <569d73fb-8ad5-46f0-bf4c-568919f319e7@helsinkinet.fi>
 <b2f74ffcd4c4a8aef248c21cd6deafcb92d86d37.camel@physik.fu-berlin.de>
 <022ab204-7be9-4f6a-a92f-2601fae1f146@vivier.eu>
 <5d8619dfe4134319b558684209f2b89c5c1447cf.camel@physik.fu-berlin.de>
 <479479a8-a315-4687-af2b-4fc0efed7a6b@vivier.eu>
 <d7c6cb263b3ac949c842ca7cf483fbc7a0e032a5.camel@physik.fu-berlin.de>
 <708ea8ed-c1b3-4f9a-83fe-af979bc194b1@vivier.eu>
 <0cf54bd607a7926414d6c9a0350fe93898a235ce.camel@physik.fu-berlin.de>
 <1960b583-2100-468e-8e1e-face3f7f10d6@vivier.eu>
 <5d8b1560fb29bec6d56ff6d8aafb4931a7079b63.camel@physik.fu-berlin.de>
Content-Language: en-US, fr-FR
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <5d8b1560fb29bec6d56ff6d8aafb4931a7079b63.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bIiy1vzpilPXhd/Qg8QWvIO1kVBAJ5WBQP93mjEi6lhqZg27PxW
 r4QEpeJLwWHnNUv6SI71cKDACY4TF4Qp5lZm0ConVrzMrK0D+VeS1o3rbYxJAq8cW3P5hqq
 DBM7/bAAtkKSvJ9vpbHoBQcr+ZL5tYYkYc3jtFP/VMbo/KGKrUW5+U0lFpv7h1Zvi5WmuUt
 KKkB93ssaLxxAOHO3gDCg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GSV3BbcShLE=;hAN84XLwuuLWjb2rHZp9Bb+fRoS
 Z0n3C5oI+nrxstpXXlK+fZuIuJfPlcsQ1cS9JN4rglvZEj5w6yrDzUK9qShjzh+010jiu0TbB
 nxti4i5qLGSxVa27mvOBM0dbR58NwPjiYeyVSan29r1TKz7KTJqax6Qsv18BPrB6XL8JpTQpD
 mgDP9QB23kwuNczitVBctGiRIElimS9akewi6icAA6SUk3G2hYub0nF3o/wdm5UHD7jr9Pz8Z
 z6kqY66ZW+tyYa/tX72t8mULRK4TU0NFm2nHsTaZFtcBz8EJK393D5KU/EWbYzSsI0iOCr/zd
 qlTIw8/Dt8XXOxQZHB/2gAPCRVs331ew1GVLkbZx8F5+gOmi1A61xB4anu2kOeHU5CApLlQs8
 60l+kD7zvih2H5y9moNccyhAiYRq8rJmrypQ3oJbPN1Lwlqb4MfG1bVj7o6b0gkU7RFdpbTMf
 FekGhZwQDyX9Iqejgpfl5lR5AfhvKr647qQeAdSeERdPLFjZEQIXnSR8DgxRAp140XY3Cekku
 4qeZ82/EnZT1BmXi1mWyvvSAGBCQ7c6/gVxo/nO3lHLqWwr9I6eHVxOkXY3fPalbKhPTIlS3x
 ZWr/SXPP+4nJuvd1Gkukaihy4+rV3R/k4N6Z6S+vBo2HQrjOpSrssQnOIkCKZ5HrqrfSFXQP1
 I48nD3GBUje83qzM3PqDzwIWLi9qpoJH90yjHVA3cFak4Gy0EzHcUzOnSDBBKUBgSLiX0dl2q
 jj/WRgLQw1mrhiIJ74f73fRreNkgUcJtxhThrrUQc9K33iVwMPuD2xMx5IPbyMOInK2pwACXI
 yAPxhFAP9PnXpzd8vSEkUx/t+y/ceo05KtnwDp7/wI9XhvJGVFvoMsLnVJSidAP3tb4TKiQcY
 SplKgzXtxi/sK4n17b0gB6oJB1PqLCWAgNjD9eVKzvhig2WkVI3LIGNdJyUsJmEDsaic3K4pJ
 BYe32J2dIWRVk1nw4qhYxBwAqdFHB9tgnK/+AX9Z6rV1piK7zklotPPOkwEI9pPYxqeqtX6yN
 aZMpnOWcztk3JINjmKl2jnHbq+I4mthP39XERhDepgrv0Gcwhh0lw4dCxjuDM/ya7qRUyi0BF
 UPS8Ez90YI6hZlI1b9/Dy7NmI2aJ6Fi/JbYLgFlavV7wLeozgnIXshkiNICukOyn7EDy9sXUP
 oN/ojEtIV+dWTKz7Wa0jn32soBl1bHWU+ivAUP2t83HFMzKw3bG7kVdkSdqJmxcpbDUQIFCRj
 TDvRIMQevcCCS6xyBcQt18BG8krsDzbDXMpi2CHaCnaaZJpKgWAW23wI49YCO0R/GvAg+v+QU
 dcmRjH8+CNS/zhJgL/4O6qX1NnWyvAA1m/CZelg7X82FzzlYTX/JhR4McQhFPqdHdoNACQMIG
 B54BLTJHCJByfVBfekTbUzJ7Ko0QvnYM1Aj5g=



Le 16/06/2025 à 11:00, John Paul Adrian Glaubitz a écrit :
>> And there will be a problem with binfmt_misc because we can't rely on
>> the ELF signature to know which qemu-user to run, the one with 2byte
>> alignment or the one with 4byte alignment?
> What about the ELF note [1] that David Brownlee suggested? Can these be used?
> 
> Adrian
> 
>> [1]https://www.netbsd.org/docs/kernel/elf-notes.html

binfmt_misc doesn't use the sections to select the interpreter, but the 
128 first bytes of the file.

I think you need to change the ABI type in the ELF header:
https://fr.wikipedia.org/wiki/Executable_and_Linkable_Format

Thanks,
Laurent
