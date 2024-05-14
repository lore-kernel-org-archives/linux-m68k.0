Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9928918131F
	for <linux-m68k@lists.linux-m68k.org>; Tue, 14 May 2024 20:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715717775; cv=none; b=qOnSOmWEYw1TyLjuIc/pQbYOvlixRRsjZ0em1T15VsXKpgFBUTHnWPSFGOv/XUIYwXdyMAiosBR48b24AVp4AQsaq3W2DPDuvLQSqV7qSFfPpvF243/XX9SEZlXhWjrZr1i7xsl6EQmYD+oXtNJ4XX0TV9M97vgerGlKGtaTQA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715717775; c=relaxed/simple;
	bh=09aeAwej7EsfgHo6O/MGP7pB7N85X1Y090QqEZO7rXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EZU+Oh2Zn2lVWwASh8K0VixgP5Kq8HBcsACXLiU64TpL1F4yNdVbFkWjtPAukz3kAGQuH8tYvsZSqnjsMxV0nY4tluOH4NQsKSEgYqDWLd/T01Dlv8sqpElz8z9L9QMbtLWxQkJpPdnjRGIt37d7W8KNVyREldF+ZTTSoalBA6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2eXq+cU; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2eXq+cU"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1eeb1a4c10aso36702895ad.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 May 2024 13:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715717773; x=1716322573; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=abLU5jDFPnL8SD6ti4LhQHY37so+gw61/l2yH0XV0kA=;
        b=d2eXq+cUa6HvFjfTVqtTAzUUwpyf+sKp47lPvE2uqwh7lAhj26oZ18bSRqHEg3lhAV
         0L0g6CUW/aIa0XkUPKXfJYBqiPc+ioJysosEulCTzUVRzn6LXH4S8j+I4h6Nv9t9avQq
         kM/vVb/yiG5GGgimOdy1zy4NTYorRgJ3r9Xwrzu0VrMNef8NAxEPiuNINFQrkM2U69u8
         fcSWQ5g3sJZ0vCawyuzEWn9UjX5xhAWzntKXNJRJ7Ygh0RE2s63wE481YIQTRkSxB3wg
         knapbKuwKMERNuSkplMX4T2KjoTJEJn3qW1Uo1gWpafgP+cRJEOpdN+LgBFWQYcsUdyw
         YOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715717773; x=1716322573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=abLU5jDFPnL8SD6ti4LhQHY37so+gw61/l2yH0XV0kA=;
        b=fZWp1fbkWkSe/ejPAvfhgtdaiYCf4zi1I140wnICbg6ErnPOWfvHuxf/An/fn/inSt
         48H4OXHvFcBrAmUgIDMN+b1B43exzUZMtlSPBZR3c69P1W5j2AMeTzj3DvSZnvTAuAH3
         81AaaoOrcJPqg+aGc4W3jmwQV0Sd44uZn2Gt3fq6ZMKbjt1KnrLY8kVlkofbCaB2xLX2
         e/voosGyHUw0gLHBLWcGb26hy6J5LAAQeI/Q9mZI/SV70/Tfv94FMj/Z4pEscLZDW6Hf
         qwdTNjnokEob2/7K3mEMavfoW8wfR4DdMgZ7tNTgIv2GEu8Jn59XK4DSkYPINLR/6zv+
         idCA==
X-Forwarded-Encrypted: i=1; AJvYcCW0DmB1kARWumRh4Nhp9BQ+uXtDPEuSJrFa8Ozwmc4bodSIziLz5oyKVThZUG56RxMZJr7sY2sIR+Caw4OASr86x6oDBSHzHS9B/qzKj6Og
X-Gm-Message-State: AOJu0YyolxvDaC4BDsptoKG5jsAfEach/lgT4PRCBRJlVXZY2FsKSs79
	Yg2/1mgqcFMdacUJn//OGXIxYjuZIMrZT9djDh1XplVTP702s1VWRucDXw==
X-Google-Smtp-Source: AGHT+IFE/+G8JEh84BOgrroCZwEfeIZfwUt7jgWM5msbZrBGt16B+BpS1sKMQpdAodJSopi/oHwGoA==
X-Received: by 2002:a17:902:d483:b0:1ed:867:9ea0 with SMTP id d9443c01a7336-1ef4404a894mr155908125ad.57.1715717772672;
        Tue, 14 May 2024 13:16:12 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:cce2:5e6b:f484:1b3f? ([2001:df0:0:200c:cce2:5e6b:f484:1b3f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f07dec3fb2sm30300555ad.63.2024.05.14.13.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 13:16:12 -0700 (PDT)
Message-ID: <d18dab84-f6d8-4732-88cb-8b95bd4487f3@gmail.com>
Date: Wed, 15 May 2024 08:16:13 +1200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel Image Format Issue - Coldfire mcf54418 CPU Failing to Boot
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 linux-m68k@lists.linux-m68k.org
Cc: geert@linux-m68k.org, gerg@linux-m68k.org
References: <68ec857f-a559-4f71-87ba-425b4ee7c9c7@yoseli.org>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <68ec857f-a559-4f71-87ba-425b4ee7c9c7@yoseli.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Jean-Michel,

'BIV' is probably a bootinfo tag (Boot Info Version).

Cheers,

     Michael

On 15/05/24 07:11, Jean-Michel Hautbois wrote:
> Hello,
>
> I have been on this for a long time now, and I think it is time to ask 
> for some help as the answer might be "easy" :-).
>
> I'm trying to boot an upstream Linux kernel (version 6.1.83 from CIP) 
> on a custom board which already runs an old one (3.0.12).
>
> I'm encountering an issue where the CPU fails to boot with an 
> "Unexpected exception" error when u-boot calls bootm.
>
> -> bootm
> ## Booting kernel from Legacy Image at 41000000 ...
>    Image Name:   Linux-6.1.83-cip18-rt10
>    Created:      2024-04-17   5:42:32 UTC
>    Image Type:   M68K Linux Kernel Image (uncompressed)
>    Data Size:    5684872 Bytes =  5.4 MB
>    Load Address: 40001000
>    Entry Point:  40001000
>    Checksum:  6bc7660a
>    Verifying Checksum ... OK
>    Loading Kernel Image ... OK
> OK
>
>
> *** Unexpected exception ***
> Vector Number: 5  Format: 04  Fault Status: 0
>
> PC: 40001002    SR: 00002700    SP: 4fd5fcdc
> D0: 00000000    D1: 00000003    D2: 4fdfa71c    D3: 00000000
> D4: 00000000    D5: 00000001    D6: 00000000    D7: 00000001
> A0: 00000000    A1: 4fd71494    A2: 40001000    A3: 4fdfa690
> A4: 4fd91b30    A5: 4fdf3600    A6: 4fd5fd64
>
> *** Please Reset Board! ***
>
> I tried to use different Load and Entry adress but this is not having 
> any effect.
>
> Sadly, I can't use the (very) old toolchain to build my kernel, and I 
> can't build the old kernel with the toolchain I generated. It has been 
> done with buildroot and I can provide some information if this is 
> relevant.
> To summarize:
> - It has MMU enabled
> - The cpu is passed with -mcpu=54418
> - The architecture is passed with -march=isac
>
> As the u-boot version I have can't be updated (at least not easily) I 
> need to provide a uImage, so I call mkimage for this when the vmlinux 
> file is generated.
>
> I've compared the kernel image format with an older working kernel 
> image, and it seems the issue is related to the kernel image format.
>
> ```
> $> hexdump -C uImage-3.0.12 |head
> 00000000  27 05 19 56 c6 4d 40 59  62 ac 6a be 00 2f a2 00 
> |'..V.M@Yb.j../..|
> 00000010  40 02 00 00 40 02 00 00  74 e8 ca f4 05 0c 02 00 
> |@...@...t.......|
> 00000020  4c 69 6e 75 78 2d 33 2e  30 2e 31 32 2d 72 74 33 
> |Linux-3.0.12-rt3|
> 00000030  33 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 
> |3...............|
> 00000040  60 08 42 49 56 1a 00 00  00 00 4e f9 40 30 20 00 
> |`.BIV.....N.@0 .|
> 00000050  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 
> |................|
> *
> 00001040  4e f9 40 30 20 00 4e 56  00 00 9f fc 00 00 00 04  |N.@0 
> .NV........|
> 00001050  48 d7 00 01 20 2f 00 0c  4e 7b 00 03 4c d7 00 01  |H... 
> /..N{..L...|
> 00001060  df fc 00 00 00 04 4e 5e  4e 75 00 00 4e 75 4e 75 
> |......N^Nu..NuNu|
> ```
>
> ```
> hexdump -C output/images/uImage |head
> 00000000  27 05 19 56 ab 1d 06 74  66 1f 61 48 00 56 be 88 
> |'..V...tf.aH.V..|
> 00000010  40 00 10 00 40 00 10 00  6b c7 66 0a 05 0c 02 00 
> |@...@...k.f.....|
> 00000020  4c 69 6e 75 78 2d 36 2e  31 2e 38 33 2d 63 69 70 
> |Linux-6.1.83-cip|
> 00000030  31 38 2d 72 74 31 30 00  00 00 00 00 00 00 00 00 
> |18-rt10.........|
> 00000040  7f 45 4c 46 01 02 01 00  00 00 00 00 00 00 00 00 
> |.ELF............|
> 00000050  00 02 00 04 00 00 00 01  40 00 20 00 00 00 00 34 |........@. 
> ....4|
> 00000060  00 56 bb b8 00 00 00 26  00 34 00 20 00 04 00 28 
> |.V.....&.4. ...(|
> 00000070  00 12 00 11 00 00 00 01  00 00 00 00 40 00 00 00 
> |............@...|
> 00000080  40 00 00 00 00 39 d3 d0  00 39 d3 d0 00 00 00 05 
> |@....9...9......|
> 00000090  00 00 20 00 00 00 00 01  00 39 e0 00 40 39 e0 00  |.. 
> ......9..@9..|
> ```
>
> I am a bit surprised by the information at offset 0x40. My kernel is 
> an ELF file, but the old one is a BIV file I don't even know what it 
> can be -_- !
>
> I'm happy to provide any additional information or details that might 
> be helpful in resolving this issue.
>
> Thanks in advance for any help !
> JM
>
>
