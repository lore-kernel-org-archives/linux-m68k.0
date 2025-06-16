Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AB326D4C7
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 11:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750071927; cv=none; b=DVXeEhBJrkrI+0edMdtUy9l6Y/8vputyfvQqzSaeRMlked56CpFl30eP5+XcFitXssOPpffgt4ahoCfguWTPGfMrsb2Ja+edtkTBTXLvbQHehFoHNPuBdHYlJfHLv6igPP6vKgGMCB3PQwWfZCFbsecEpxHIemQZC0KidF0/lpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750071927; c=relaxed/simple;
	bh=xbUQyo3f8zvG/NowissGmEeE7dR4trAhwS+NX4sIlnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CutFv4ZWu2IJasrmpvEDrhjjL93H5EniqXlfeIo8VPXbpp5Ag+Tho1G1Ube3yhIUg2RYNarGnhZkQiI1AJVEIQ6Uk+6xCxEY+/Srkc+ZLvRRMQJXzxQpK+DSWJzNUyQxCD8mjygETAofOAJpnU0DJgtCA4YoqKNp/fXJoExi5GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vivier.eu; spf=pass smtp.mailfrom=vivier.eu; arc=none smtp.client-ip=212.227.126.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vivier.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivier.eu
Received: from [192.168.100.100] ([82.64.211.94]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.168]) with ESMTPSA (Nemesis) id
 1MSbov-1uFjlT1Nfd-00M2Ip; Mon, 16 Jun 2025 13:05:22 +0200
Message-ID: <52a181ca-a6fa-4f1a-9344-3e809a036cfa@vivier.eu>
Date: Mon, 16 Jun 2025 13:05:21 +0200
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
Cc: port-m68k <port-m68k@netbsd.org>, debian-68k
 <debian-68k@lists.debian.org>, linux-m68k <linux-m68k@vger.kernel.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
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
 <7a80e6f1-1ac8-4082-b37f-f577ca0bdd5d@vivier.eu>
 <CAMuHMdUH3zfrxSV9UqxnG1dEnHA_SmeYVsmKzV3kzYq6TLnucg@mail.gmail.com>
 <f869d1238c15875a29f4cdf7569c176ba81fd6c4.camel@physik.fu-berlin.de>
Content-Language: en-US
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <f869d1238c15875a29f4cdf7569c176ba81fd6c4.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:qMKKYzPYZg0UEWBUZs/hJpiJzh58/yVW58IHTlLGst1emKqC94U
 HyktN2QyR+k39fLc3f0EuxpPKEjooL1UTTcB5WISWakZ+g7JfXnYbQYtb/6F9JpPT8V5Bb1
 yweUTN5YnfOIASrlFA6fgSkaTJL10Vm0lEW+MkzOhi+a1CQJi+h2I5f/lDb+VC5djQX/06v
 wkgyUQy+ecrGTtDhB3wrg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FT3HFKhIpME=;ThpdY8CBi+XEclg3KIJgQjw1qik
 DGM8tdIrGI7IwUd9o+rr2Bqg/g11U1wkIz+rIExM/P40u/agWwRgbJen/smSmn+qjP95xx8d6
 ++BcJG4ZWi1tixtOf3blP/I+usVOJiyVywTQU61xOtCsLe3wnEIZOd5krhdlVwJXJLCLuyp2G
 3H3B8UqcukggRvciFowuLP9tH6eEHZQGlL2Qk9Cwn51+K8daoOs10K+2juITfSebksQ6VMngA
 FV2LRiLPGT+0x2y8MdsYi2Tn7Uj7cLtSuj1DsFMIg5JHn+WyDaAyU47b1AiGbqonLh+jDFYtV
 Ab24oiAYZm/No43dXFLp5wsFfHSJthebFa08IhQifd46L4qCCuj7jAy2Nu8rMUERwswQXr73o
 nj3jjZxAeN42tFpRjbFrGOlDeZesKhO8feAJOeNpN2KSE8agpRxQiXF+yarBGw3ckCfwgY860
 YjCCCl6fag/sbyPLha2tj0IhItKKhlQnXyVneMxNb0Hje8RPWdgTWkz0ERqii+r0aBUKItLpL
 VmFVFdwKxdb31B5Ifu3gWies1oSYff73si7YBNYWT2ZLtYOZWguzgwaI9DlQYGE43p0c17NiS
 qkUjUFgrYtAX5pAk7inwZuKNHsFKIAjRdrJinLfU+aSZNOS2RYbufIj3FdPiUnEym63MXRPnv
 ZQmWkIRT5NA5WV0sE6n6ROTfvyRoHfSh0OsbxgwEnNxVvvIHCLT3SYDpztisxZp5k9c7nz0pC
 Kx2iz0ewwXjGUv668vnKOAawRlzx66wUch3l+4fiZULU5cP5MKTEp779ZxsZXLVgISEzGVCpn
 gQ2x6ioDd0WALlH6chOoGqS+VIPXjQ4/EN7gPj2o5EGuPWcLNV+HL0avzKtb+UTTGl6f0hznb
 Vpsttbtsx5CVB/X/3nqizEYL2V/y/2SCBKJX63ruWXdHKMgbHrqeT5CN+Cq+L01rMRRo6YEHw
 q8ZJpiA/kQjRAmMnHOHOMq39MSBK/kYyk57LCSudL3uZV0cV+VPivpQxQSQDGBGqKm12yh/gx
 v296qKL2K77IeQvPm501P6qmj/LtEfIlCWrCYhyufKjRK6ZFO58Dd1mGvJcUaR9C8GzR47cSO
 t+UWHqZlqb8VYKv3bFr5BQYuXP6Ha/KzxrxJNBc4kt7I/9AaRAkhyVsT+5ugY5aflCmcfVkDr
 w4IcZ9jDqkbUmDVP3aY2CyaOJh/jPLAQ4Tqcy8CCkEjLn75hjtXioIckftG7DatL7kP2WVCsq
 byBAkkKRuw2PE+28AzKeUzyGCrUe3PNU4IJDm0Fv45wXFsA6cOeReL5IfyDBk3SNOmRLqr3Qh
 afwHbgPvCZirHVAc0K2O1q8EF9mD8tbTMYbqxmf60UFohD7587JfY3vIun1CFv8FKQtvdulm3
 rp/JM8shzgFUms9aGND3E9LdYLFxUbGyopxAltkzejnBckyfNnYnUh5N18

On 16/06/2025 13:01, John Paul Adrian Glaubitz wrote:
> On Mon, 2025-06-16 at 12:07 +0200, Geert Uytterhoeven wrote:
>>> I think you need to change the ABI type in the ELF header:
>>> https://fr.wikipedia.org/wiki/Executable_and_Linkable_Format
>>
>> Interesting....
>>
>> Does any system actually use ABI (byte 7) = 3 (Linux)?
>> All of amd64/arm/arm64/ia64/i386/m68k/microblaze/mips(el)/powerpc/risvc/s390/sh/sparc
>> seem to use 0 (SYSV).
>>
>> #define ELFOSABI_NONE   0
>> #define ELFOSABI_LINUX  3
> 
> Strictly speaking, a value of 0x00 indicates SysV ABI [1].
> 
> But maybe we could use 0x03 for Linux/m68k with 4 bytes alignment.
> 
> Adrian
> 
>> [1] https://en.wikipedia.org/wiki/Executable_and_Linkable_Format#ELF_header
> 

I think an e_flags with a new value like EF_M68K_ABI2 would be more appropriate.

Thanks,
Laurent
