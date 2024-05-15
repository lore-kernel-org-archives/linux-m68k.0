Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54294EDF
	for <linux-m68k@lists.linux-m68k.org>; Wed, 15 May 2024 07:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715759816; cv=none; b=rldbZlhkr/sp4oeV3O8ovsXgZcUywsx34vy4Y5kHGu76qaA3rcqZcKY6vvBzP+c4fXKTiBit8PVFl1tu84OzEeXRuLrqTe5Wimo0FzbUp8pwDblV6Y2f1JCPNNfHdtBLp3gyqlLsV0qv01GRD+oH5VoRKihlyTFu21/TsmbJhYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715759816; c=relaxed/simple;
	bh=HyBX3oqZRMchN++B28ipyI/d7OU4py9silSsIGMkkhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H1LgAqYoAJn+BC7sFBwJj/HAnXBwk54jTgj8OgkVR19dtJQ6p/iPo1Nmy8w8ZGHP4nEVpID+Z2TjYfOehjH5Kkr77jW0f6SdRZf1heLjZyq6IWheCA+Adq2WHNrjnBbRVQqo2Wjc30E1fJ3QAb6yEp3x4tKGIMuuYBIFQH0HwC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=QL0mUWEa; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="QL0mUWEa"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A4E4240002;
	Wed, 15 May 2024 07:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1715759806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xJdAAxrHUp2f3V1ekE0zUU2u8VlqZRoXwnJNdDFDhAE=;
	b=QL0mUWEaBwIsdhLVz56DKMJ20/dUJUlNBc0Y/P4IwBkNJZraAs4voBVvlqV/P+I+7/eBmc
	6JbGBrhz12UvYhWTx55MC4VzP60yC5lOC5We/WF4YI26tI7sHxpXuSF267pb1O0BHG5r2M
	jlMoXXGIYXvfFoxOD8iWktQ4zG1NLwV1MRJNtFEuidnxv+0qYifqRX/IMQGy2Go5NQZ85a
	JrwUljhvVNPmxbLImP0LRRdXlsYiBXuQr2AxBVi8c8lfMIsGKucpPAZd7PqDcrqishAL+8
	nX1OAWVBaPc+vvZeT0D7uO21d6K7vMnhSNn0rv0Py93NVfXbcjd7tInr3wi0TA==
Message-ID: <45745b6a-341c-4f9c-8787-6154393d1223@yoseli.org>
Date: Wed, 15 May 2024 09:56:46 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel Image Format Issue - Coldfire mcf54418 CPU Failing to Boot
To: Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@lists.linux-m68k.org
Cc: geert@linux-m68k.org, gerg@linux-m68k.org
References: <68ec857f-a559-4f71-87ba-425b4ee7c9c7@yoseli.org>
 <d18dab84-f6d8-4732-88cb-8b95bd4487f3@gmail.com>
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <d18dab84-f6d8-4732-88cb-8b95bd4487f3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hi Michael,


On 14/05/2024 22:16, Michael Schmitz wrote:
> Jean-Michel,
> 
> 'BIV' is probably a bootinfo tag (Boot Info Version).

Thanks, it helped me, as I read the head.S file and finally progressed :-).

When dumping my vmlinux, I can see the entry point is *not* the load 
address (it was in the old one):
vmlinux:     file format elf32-m68k


Disassembly of section .text:

40001000 <_stext>:
40001000:	4ef9 4000 2000 	jmp 40002000 <_start>
	...

40002000 <_start>:
40002000:	4e71           	nop
40002002:	46fc 2700      	movew #9984,%sr
40002006:	203c 0104 0100 	movel #17039616,%d0
4000200c:	4e7b 0002      	movec %d0,%cacr
40002010:	4e71           	nop

Now, when uboot starts the kernel, it is not doing anything (not sure if 
it hangs or does not display anything on the console. And EARLY_PRINTK 
is not valid for coldfire :-(. Not sure why, so any guidance here would 
be appreciate too !

I will now check my platform file but at least I am not trying to 
execute an instruction "0" :-).

Thanks,
JM

> 
> Cheers,
> 
>      Michael
> 
> On 15/05/24 07:11, Jean-Michel Hautbois wrote:
>> Hello,
>>
>> I have been on this for a long time now, and I think it is time to ask 
>> for some help as the answer might be "easy" :-).
>>
>> I'm trying to boot an upstream Linux kernel (version 6.1.83 from CIP) 
>> on a custom board which already runs an old one (3.0.12).
>>
>> I'm encountering an issue where the CPU fails to boot with an 
>> "Unexpected exception" error when u-boot calls bootm.
>>
>> -> bootm
>> ## Booting kernel from Legacy Image at 41000000 ...
>>    Image Name:   Linux-6.1.83-cip18-rt10
>>    Created:      2024-04-17   5:42:32 UTC
>>    Image Type:   M68K Linux Kernel Image (uncompressed)
>>    Data Size:    5684872 Bytes =  5.4 MB
>>    Load Address: 40001000
>>    Entry Point:  40001000
>>    Checksum:  6bc7660a
>>    Verifying Checksum ... OK
>>    Loading Kernel Image ... OK
>> OK
>>
>>
>> *** Unexpected exception ***
>> Vector Number: 5  Format: 04  Fault Status: 0
>>
>> PC: 40001002    SR: 00002700    SP: 4fd5fcdc
>> D0: 00000000    D1: 00000003    D2: 4fdfa71c    D3: 00000000
>> D4: 00000000    D5: 00000001    D6: 00000000    D7: 00000001
>> A0: 00000000    A1: 4fd71494    A2: 40001000    A3: 4fdfa690
>> A4: 4fd91b30    A5: 4fdf3600    A6: 4fd5fd64
>>
>> *** Please Reset Board! ***
>>
>> I tried to use different Load and Entry adress but this is not having 
>> any effect.
>>
>> Sadly, I can't use the (very) old toolchain to build my kernel, and I 
>> can't build the old kernel with the toolchain I generated. It has been 
>> done with buildroot and I can provide some information if this is 
>> relevant.
>> To summarize:
>> - It has MMU enabled
>> - The cpu is passed with -mcpu=54418
>> - The architecture is passed with -march=isac
>>
>> As the u-boot version I have can't be updated (at least not easily) I 
>> need to provide a uImage, so I call mkimage for this when the vmlinux 
>> file is generated.
>>
>> I've compared the kernel image format with an older working kernel 
>> image, and it seems the issue is related to the kernel image format.
>>
>> ```
>> $> hexdump -C uImage-3.0.12 |head
>> 00000000  27 05 19 56 c6 4d 40 59  62 ac 6a be 00 2f a2 00 
>> |'..V.M@Yb.j../..|
>> 00000010  40 02 00 00 40 02 00 00  74 e8 ca f4 05 0c 02 00 
>> |@...@...t.......|
>> 00000020  4c 69 6e 75 78 2d 33 2e  30 2e 31 32 2d 72 74 33 
>> |Linux-3.0.12-rt3|
>> 00000030  33 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 
>> |3...............|
>> 00000040  60 08 42 49 56 1a 00 00  00 00 4e f9 40 30 20 00 
>> |`.BIV.....N.@0 .|
>> 00000050  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 
>> |................|
>> *
>> 00001040  4e f9 40 30 20 00 4e 56  00 00 9f fc 00 00 00 04  |N.@0 
>> .NV........|
>> 00001050  48 d7 00 01 20 2f 00 0c  4e 7b 00 03 4c d7 00 01  |H... 
>> /..N{..L...|
>> 00001060  df fc 00 00 00 04 4e 5e  4e 75 00 00 4e 75 4e 75 
>> |......N^Nu..NuNu|
>> ```
>>
>> ```
>> hexdump -C output/images/uImage |head
>> 00000000  27 05 19 56 ab 1d 06 74  66 1f 61 48 00 56 be 88 
>> |'..V...tf.aH.V..|
>> 00000010  40 00 10 00 40 00 10 00  6b c7 66 0a 05 0c 02 00 
>> |@...@...k.f.....|
>> 00000020  4c 69 6e 75 78 2d 36 2e  31 2e 38 33 2d 63 69 70 
>> |Linux-6.1.83-cip|
>> 00000030  31 38 2d 72 74 31 30 00  00 00 00 00 00 00 00 00 
>> |18-rt10.........|
>> 00000040  7f 45 4c 46 01 02 01 00  00 00 00 00 00 00 00 00 
>> |.ELF............|
>> 00000050  00 02 00 04 00 00 00 01  40 00 20 00 00 00 00 34 |........@. 
>> ....4|
>> 00000060  00 56 bb b8 00 00 00 26  00 34 00 20 00 04 00 28 
>> |.V.....&.4. ...(|
>> 00000070  00 12 00 11 00 00 00 01  00 00 00 00 40 00 00 00 
>> |............@...|
>> 00000080  40 00 00 00 00 39 d3 d0  00 39 d3 d0 00 00 00 05 
>> |@....9...9......|
>> 00000090  00 00 20 00 00 00 00 01  00 39 e0 00 40 39 e0 00  |.. 
>> ......9..@9..|
>> ```
>>
>> I am a bit surprised by the information at offset 0x40. My kernel is 
>> an ELF file, but the old one is a BIV file I don't even know what it 
>> can be -_- !
>>
>> I'm happy to provide any additional information or details that might 
>> be helpful in resolving this issue.
>>
>> Thanks in advance for any help !
>> JM
>>
>>
