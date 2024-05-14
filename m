Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFB8180A88
	for <linux-m68k@lists.linux-m68k.org>; Tue, 14 May 2024 19:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715713894; cv=none; b=Uh8Pe5+AQQ9Y7E39aas6WzUKJtYkfHW3Ys8AjM5UA2CGsEgNU8nIK6CyMhnmC+hTTlen8kLFKH4e7Tla2BOqBoov34+1eQY9rfKo3Iu0wHIwxSuY6KVGGnlJgPaZ6lPbT6UDlzvE7WOlQ0jSTZudz7VtgDZ0ekCVnLDMSNDoTS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715713894; c=relaxed/simple;
	bh=iJnz5eZvazkr1aNyzHFDdujklkyHWgGS6XmcURCiqwc=;
	h=Message-ID:Date:MIME-Version:Cc:From:Subject:To:Content-Type; b=f9Pq6GOyAWDsBYZb89/6WcTxaLQhodJCzCI3dF36kkwF/jOitBVAGbATWVaR7NC+KsvpyrCSt5zXNYjCftqKg2DB7lW+b/LSAeV3GVHiGFqB+PEsqKzZFKZSI6Zow9n6ypbBHiIL2/LZbfhXXQCmzYWQ4uj5XDymQWH4/ORb7gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=ClQ5B2XD; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="ClQ5B2XD"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D51D1C0005;
	Tue, 14 May 2024 19:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1715713889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=l5hv5Ts1eL31ytXvpEEOTfX/1gW7yx3GX2+vA2bqDTY=;
	b=ClQ5B2XD2jE2j6XjSD3jAz+nLhDX8b5toCfoTxQ7pyLAgBggak84dF3kbI2bFGrWe+Mhc1
	8DDq1yG0BsFf2zngLajzYBx3KCQEeDJX8Y/fXNDtxtwOVkKv/ctYZrBXdPxH5JVapDJsgB
	LqKo6QECGtgnDODR1qw9/84KcXe0/9/8kUaHPDmBtHvt8cl+LXjL+3ZGG8CEBu83BO0s1s
	uHfOuzgTxfuhRKTU9IoGxXxWAvmHJGe7sIFVVYmg1ZeL6wIwctwY0Epdn3misJDRtRlal5
	THSpzIuwvXfya8PreSukvxfgRXByBnG+llY+oJaLyFvy0/2F4IT2Qrs6nEBV/g==
Message-ID: <68ec857f-a559-4f71-87ba-425b4ee7c9c7@yoseli.org>
Date: Tue, 14 May 2024 21:11:28 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
Cc: geert@linux-m68k.org, gerg@linux-m68k.org
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Subject: Kernel Image Format Issue - Coldfire mcf54418 CPU Failing to Boot
To: linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hello,

I have been on this for a long time now, and I think it is time to ask 
for some help as the answer might be "easy" :-).

I'm trying to boot an upstream Linux kernel (version 6.1.83 from CIP) on 
a custom board which already runs an old one (3.0.12).

I'm encountering an issue where the CPU fails to boot with an 
"Unexpected exception" error when u-boot calls bootm.

-> bootm
## Booting kernel from Legacy Image at 41000000 ...
    Image Name:   Linux-6.1.83-cip18-rt10
    Created:      2024-04-17   5:42:32 UTC
    Image Type:   M68K Linux Kernel Image (uncompressed)
    Data Size:    5684872 Bytes =  5.4 MB
    Load Address: 40001000
    Entry Point:  40001000
    Checksum:  6bc7660a
    Verifying Checksum ... OK
    Loading Kernel Image ... OK
OK


*** Unexpected exception ***
Vector Number: 5  Format: 04  Fault Status: 0

PC: 40001002    SR: 00002700    SP: 4fd5fcdc
D0: 00000000    D1: 00000003    D2: 4fdfa71c    D3: 00000000
D4: 00000000    D5: 00000001    D6: 00000000    D7: 00000001
A0: 00000000    A1: 4fd71494    A2: 40001000    A3: 4fdfa690
A4: 4fd91b30    A5: 4fdf3600    A6: 4fd5fd64

*** Please Reset Board! ***

I tried to use different Load and Entry adress but this is not having 
any effect.

Sadly, I can't use the (very) old toolchain to build my kernel, and I 
can't build the old kernel with the toolchain I generated. It has been 
done with buildroot and I can provide some information if this is relevant.
To summarize:
- It has MMU enabled
- The cpu is passed with -mcpu=54418
- The architecture is passed with -march=isac

As the u-boot version I have can't be updated (at least not easily) I 
need to provide a uImage, so I call mkimage for this when the vmlinux 
file is generated.

I've compared the kernel image format with an older working kernel 
image, and it seems the issue is related to the kernel image format.

```
$> hexdump -C uImage-3.0.12 |head
00000000  27 05 19 56 c6 4d 40 59  62 ac 6a be 00 2f a2 00 
|'..V.M@Yb.j../..|
00000010  40 02 00 00 40 02 00 00  74 e8 ca f4 05 0c 02 00 
|@...@...t.......|
00000020  4c 69 6e 75 78 2d 33 2e  30 2e 31 32 2d 72 74 33 
|Linux-3.0.12-rt3|
00000030  33 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 
|3...............|
00000040  60 08 42 49 56 1a 00 00  00 00 4e f9 40 30 20 00 
|`.BIV.....N.@0 .|
00000050  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 
|................|
*
00001040  4e f9 40 30 20 00 4e 56  00 00 9f fc 00 00 00 04  |N.@0 
.NV........|
00001050  48 d7 00 01 20 2f 00 0c  4e 7b 00 03 4c d7 00 01  |H... 
/..N{..L...|
00001060  df fc 00 00 00 04 4e 5e  4e 75 00 00 4e 75 4e 75 
|......N^Nu..NuNu|
```

```
hexdump -C output/images/uImage |head
00000000  27 05 19 56 ab 1d 06 74  66 1f 61 48 00 56 be 88 
|'..V...tf.aH.V..|
00000010  40 00 10 00 40 00 10 00  6b c7 66 0a 05 0c 02 00 
|@...@...k.f.....|
00000020  4c 69 6e 75 78 2d 36 2e  31 2e 38 33 2d 63 69 70 
|Linux-6.1.83-cip|
00000030  31 38 2d 72 74 31 30 00  00 00 00 00 00 00 00 00 
|18-rt10.........|
00000040  7f 45 4c 46 01 02 01 00  00 00 00 00 00 00 00 00 
|.ELF............|
00000050  00 02 00 04 00 00 00 01  40 00 20 00 00 00 00 34  |........@. 
....4|
00000060  00 56 bb b8 00 00 00 26  00 34 00 20 00 04 00 28  |.V.....&.4. 
...(|
00000070  00 12 00 11 00 00 00 01  00 00 00 00 40 00 00 00 
|............@...|
00000080  40 00 00 00 00 39 d3 d0  00 39 d3 d0 00 00 00 05 
|@....9...9......|
00000090  00 00 20 00 00 00 00 01  00 39 e0 00 40 39 e0 00  |.. 
......9..@9..|
```

I am a bit surprised by the information at offset 0x40. My kernel is an 
ELF file, but the old one is a BIV file I don't even know what it can be 
-_- !

I'm happy to provide any additional information or details that might be 
helpful in resolving this issue.

Thanks in advance for any help !
JM

