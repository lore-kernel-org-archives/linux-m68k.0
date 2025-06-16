Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175EE29826D
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 10:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750071115; cv=none; b=k6oAw6UDtO3bpkHpPoBQCBMlbUaiCYNAPsxPn2LeqZVMj/8ST97PKRswbKAJPQcno49o9Gwaz+webSj8bvEAMo70738ZEsKN1pO1VXDpk6M22f9A8nPPYqDU53iVM5pzqDu+eTbYsh6qFQRfQSXovz5oqEDyekDWrcrWCLHc4lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750071115; c=relaxed/simple;
	bh=cJCK5uCaS77iq+FzMX1PlKTVOtauE0eLM5V2DsuCBfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XFcXc2M8vy3ulYc4OH1Cf9GKszAKlYRiokKWGcjfNn8Uiqucjgg3xxtLA+H26gg6e8U93ccfu9dtR9Dh04aaALfkBXKsPBoS/G9kZYsLqOETaJR6VwwxGH0/D+DKxMOnHB6dK0y1h2xHRtK5CMrAw65i5mCQodenm4opbvxBnHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vivier.eu; spf=pass smtp.mailfrom=vivier.eu; arc=none smtp.client-ip=212.227.126.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vivier.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivier.eu
Received: from [192.168.100.1] ([82.64.211.94]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1McH1Q-1uwstL226W-00nyeK; Mon, 16 Jun 2025 12:51:47 +0200
Message-ID: <d8d3ef11-0aeb-4923-a5e9-9a304c2aec4f@vivier.eu>
Date: Mon, 16 Jun 2025 12:51:47 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>,
 linux-m68k <linux-m68k@vger.kernel.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
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
 <7a80e6f1-1ac8-4082-b37f-f577ca0bdd5d@vivier.eu>
 <CAMuHMdUH3zfrxSV9UqxnG1dEnHA_SmeYVsmKzV3kzYq6TLnucg@mail.gmail.com>
Content-Language: en-US, fr-FR
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <CAMuHMdUH3zfrxSV9UqxnG1dEnHA_SmeYVsmKzV3kzYq6TLnucg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0mlYtzd4COMLTD2HrrpbFXZoPLthIXTVNncdt6Q/CeXgR5ipmzs
 krcW5BLskCd0yS4w2NcgJjTN7Gxcp+kJ6IRHJnsKIeTi0fn24HnAKw7Hca3lgWOqZyR2yo4
 8mCrGMwcXG5XOXq8Rg1DFSUtWBWUuDbOfD/7xoTXdUAErIru354i2U9OyAt69HJaocMjpDO
 ZJzH/zTP0vdI6OQpp8G/w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qiWpE2YYn48=;X4vefQGyZ0EwxqPrlsRXqsbMYzp
 DFaiqpYBNVFq75n8O1HFKw++/H/aoMau3hMOPK+XhlRKqMLSnPU4yDfvwpRlyDrKyuAh3Bawh
 bMDo/mmmJS41ubQUaBK1QGRc6p3OwL9Z5yzTO70nAbqlfoOdKSQdGYFxiiBiC80msdmR4dtnR
 4tCbsNCikxgpQSJWdFa0m4fj6C55AxjVkHBKK1tedQoG+BHmQlqzc3m/7ZWrmA5TSklSuFgyv
 ed9qjcPBYVZRR9HNRwca3mwP8tPMxPvKhb22davxxCbqyFV4eRaSPzrNOC949MJhrsBlz+4ZQ
 S7DRoVxquMC131nzlzZb7DP7JM1iyBVNMkD+Y6wd8SX7LWgLOom+/s86+7IzoHoeGZDPakJ20
 qs6aWYrw0cByZVZLLTRFODRf+hB0gJ6AWqV0nMETS6XX5NJs2pembdOcVqVQc0HEpw05/kzjA
 HfzmvbSPWmGAQpw4H4mi1NzEZRt44BSFmyRH6fnrwX4ODp8Q6CR1K48VjWwIbHC4HH4xAZhH1
 O7obIIM9fROxL71RMgZiKBUHgQCG/9boMHuQ5HCJKEb1EZ5FklaFbOSMP1R5cOhog8AJyBzRE
 GRkFYbipibh+wl9PQGoeUbB0U8LVYLn0ureExmEjQiG5GafdsCW+NtJXT7tGEVCVR6vsVyk5S
 OyU2hKDuz/aD8jpi8VaZIHFCSvDeE3sda88ZEkZ98PehzjQVgRnJOky1+03GyJkJXqx99KTHl
 rt9mN1ctzNkl0o0fDsU7iL/9cA4V8GqR5Xs2gZuKzSNDQffUDDBCvTEXqUSqzbiJDYdG8+reZ
 Qqce2xAbnZy349PeOap/K2vwo3m6Aet45kFcdp+5RBmSvtb3r6+xQvVu+3eZaquDTKoHZo6qh
 NqRG1FjqyDddA3za8zjnG8esuvv9pAEAVWV3PieBI5BRsEVmHcM1BDHok4CTlU6q07VON9Tf1
 o7aDACKKEkUDgY8GOMFQ2meP0KLIpqP6qPxB9TP0qGGD4a5DeL82OmUYuhvNkt17MgGlOjd5Q
 7RNII/9xL+Jb9zqWxX7zgGaqJV2aBZwZbAhvjd9Tmn/+im5n/Ii0wOwRVaOhA3Q2CHP8hwjiL
 x8xSKzG7DvWsEKrcGU+kpI6EArFBsWi7Xl61/jtZZABt752+KpjhbSdsOEiTAhwomykAmCkl/
 iBVUH392PvrQrM0seyFUDUKveePjt54x/NpGWbcaywlAw2IEsGzuJgwRUrGlM3nZsrDjhNoe9
 vdYYUCTqP5nT9lrckEnp5bvJZaaVwUwgZEYKZYySRb2SvK8dsjJxgCdfKJAUvllHAMzNMcSNh
 GA3PA/FQRRePlQroaydpVFac/PfUx7pxHrSaSKywsFqqwPg65hxOGodo8S8jcE4qhs/jcM7Oo
 k5k4bC39t7t5KqL4IEtYvQZn5oG8RLxwe2++GKcwPNJMCZzSZ5+aYLVgn9



Le 16/06/2025 à 12:07, Geert Uytterhoeven a écrit :
> Hi Laurent,
> 
> On Mon, 16 Jun 2025 at 11:16, Laurent Vivier <laurent@vivier.eu> wrote:
>> Le 16/06/2025 à 11:00, John Paul Adrian Glaubitz a écrit :
>>>> And there will be a problem with binfmt_misc because we can't rely on
>>>> the ELF signature to know which qemu-user to run, the one with 2byte
>>>> alignment or the one with 4byte alignment?
>>> What about the ELF note [1] that David Brownlee suggested? Can these be used?
>>>
>>> Adrian
>>>
>>>> [1]https://www.netbsd.org/docs/kernel/elf-notes.html
>>
>> binfmt_misc doesn't use the sections to select the interpreter, but the
>> 128 first bytes of the file.
>>
>> I think you need to change the ABI type in the ELF header:
>> https://fr.wikipedia.org/wiki/Executable_and_Linkable_Format
> 
> Interesting....
> 
> Does any system actually use ABI (byte 7) = 3 (Linux)?
> All of amd64/arm/arm64/ia64/i386/m68k/microblaze/mips(el)/powerpc/risvc/s390/sh/sparc
> seem to use 0 (SYSV).
> 
> #define ELFOSABI_NONE   0
> #define ELFOSABI_LINUX  3
> 
> Ah, parisc does. And C6x uses 0x40.
> 

You're right. But to update the ELF header with the information we are 
using 4 bytes alignment perhaps we should use instead the e_flags entry?

It's architecture dependent and it seems used by MIPS (EF_MIPS_ABI2 
?)... so MIPS is OK, I think the problem is I don't use the correct 
binfmt_misc mask...

Thanks,
Laurent



