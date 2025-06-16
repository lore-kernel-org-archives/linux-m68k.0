Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8938F4A
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 09:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750067135; cv=none; b=c/FmvBdM3UjAuEKb0ksSU2BWHFVojOA3W8H1ILPHtkuFlEXaElXZMC4JPi6Xqx3w/TEi/e/5KpNEfYEKxd+710MBkaP7XZ8LwmYTz8aTClM+jm1NH+X9gvY1XFWSxVMtjssLLrsD2iozJZ+FHmWYy07ACKje9VQJ3e5CHf57WKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750067135; c=relaxed/simple;
	bh=cGiZuxgl5Ie+UmEWKn49XXWkJhlzX24jM6lmp6Q3N7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V4GbuzYtKYxD/Bj1qTVvhy41Ehgp3+tGSDGl+n5GOIsnKczjeIi5mrSZgVnCgmO4XicgRx8asqb7artI5NRwsYFfnQkKvYJh5kqhPD0wGzFB8TkxkpfnPEUtjqqzCTDwr26z4AriFy9p18vu+ZVWJwdTa/1OXnIu2wX6wt007e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vivier.eu; spf=pass smtp.mailfrom=vivier.eu; arc=none smtp.client-ip=212.227.126.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vivier.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivier.eu
Received: from [192.168.100.1] ([82.64.211.94]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1McpW6-1uzbsG2Rbm-00pdwF; Mon, 16 Jun 2025 11:45:22 +0200
Message-ID: <f7cf2038-6651-4549-9444-dd7532c1ea7e@vivier.eu>
Date: Mon, 16 Jun 2025 11:45:22 +0200
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
 <f73add213b5c43b977967ff5c5cbd2c83c0ffb07.camel@physik.fu-berlin.de>
 <0c3d93e4-e170-4a8c-baeb-de68a7d4d099@vivier.eu>
 <67d0fd72abb56ccb580edbf31ae5142f0db760f5.camel@physik.fu-berlin.de>
Content-Language: en-US, fr-FR
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <67d0fd72abb56ccb580edbf31ae5142f0db760f5.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PXfBxHS8XFBw6ftjmuC0c6LPKzhFmhOY9M8StfwkC/HWNNwVtdl
 hoIIijpgVpJCuYyH0zcszF6szsz2ktBGhZOjI7WU9nDykQxb2j9TkJBUIE6Jx1EA4PbLgcs
 /3y2AVJhjf4PLmCp0nSNuK+3X26hAgPTIcdnAtyPy/fGINuQ+es4pUak2A23KY9xNLaEJsw
 sxi3kYSrk5sl3VK/TDfCA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wNz2/jrkLgM=;qChL5++D170FPCNa228tDC90wfp
 iyf+aodB8/LTwtCLtU6vlDAjJMpEy3747WyZRcDb/XgJq3EXSzxpiGd9PcEDv+toE85gGUQR/
 CVPH2cRVWt2iPJxgqK7gJOQIJXFyNDaOC7H6NP/ElYvp3dRJW5UOVKw+qYdoevpOT5Ru3blo0
 fsSOabZizAM7WR+dJ/VFTmeKk7SRtKOeoyWh/L1cy0oMcW00D7kqNcSvr9ssS9Y5N3vIKLyd0
 P8iqilHRM0jFrSOV+SISoDtvCbZxnyBL1gpCbFclSzI2AYDykLdExFasdwpugVm31mZUp9Pjt
 RrGZYcFiqzH2StCzTFcwoOEOs90jc5Z8RW+V9VtTyx9O1cVxG7XT9j22A4Gp09IME1t+2ST5a
 hs3IR3gNouj7K2cF9PUnWHd0IHAsMkIXwCTDbTmD39v4tMO6C6L8RlFqsqSHAwwfqjoh5pS74
 9UOoYyu/B+T6B45ckrALjiA587oS++PlLze7CUhtV0SBzHr5lmeyRrxnO2UwqcMHrLf5158bq
 Ypli3uj/M7NCnvUM47q8PUs++fY2+M7UkJn6t5xlG5JbrrKU9OU0lnumqVAwZoXLPQu9lG4Ek
 8ZtLLi+dRZHPq6sXdynRwPKP0HFjWRC1+aCk9WxDZ24OgecoA4r8pQz/tt96u3EdUhMP9yEFP
 O0KP8rFfvCtof1yHEp/8rjF7znmigXgEWbaODG5hv29ijekDAQrrwm1SUCDnhFwCBrk+iZBb/
 12pwonI+HhiMQ9rejRc+dZo29oWOeWH9CeLTPPIlhZ6ZWr5mlR/0iS/R10tBx6XHh2KPZNv8d
 lf7XOUsBhZJnlCGDdUjC58yTogyRen2FY8VqJGxUExgb+le0jCywbKg5oC09+ykVfRp8T10VL
 /Zn42hMo/vC/Up8RfLEY29HLQ7HTO+lxgFYoQs8H+BwvEdlhtGstePISN3Nptrl9UsuN0RZuB
 QiBpQWZFycxfct0gDq52MpT+/mKmWFUcIE5YD2UU9ZqItMIAHJRa0ut6QyxclarxioHaamBHL
 xi2EAoNwQGMbwtduUIIlpKlLFjwuzHQXLS+QjJeYhRkwVSMzUC5uoi1Yrp+c/ddQG93Dvax4I
 2gtoQO3zBKp1uulmUiZdZrkJ5ASwv/CQIb2WTwsLHdmcixU/LJTKycdz1otxq12GIywxjmMl8
 Wy5hFlsf0e66r8WwA3qiKhw9BFUHpC0c5ETKf/uF8+r9dbYL6PIcrcair6kAGnTu8sd+tovJy
 OPqtI7keQlYsjxPHt7QPHK7RVV4SldEqoIo65+R8cIazeQtkBAcTLB/w+dbCAGtPZP9h1nnle
 RB+YgNxkdJpFrlSsE2O+7sTnH7fkZfD81AAj595wSPDP/tCJWa271CSSlTgatYSoBclT5G2Yl
 5YBqhJ5zKLK7NdGv9tC+8swElRoxsdaFMKi/fWfVCIkxH+SPyPaCjfFqP2



Le 16/06/2025 à 11:32, John Paul Adrian Glaubitz a écrit :
> On Mon, 2025-06-16 at 11:26 +0200, Laurent Vivier wrote:
>>>> binfmt_misc doesn't use the sections to select the interpreter, but the
>>>> 128 first bytes of the file.
>>>>
>>>> I think you need to change the ABI type in the ELF header:
>>>> https://fr.wikipedia.org/wiki/Executable_and_Linkable_Format
>>>
>>> How does binfmt_misc handle the various MIPS ABIs then?
>>
>> It doesn't and it's a problem.
> 
> Very interesting. Is there a bug report for that?
> 

It’s not a bug in binfmt_misc. binfmt_misc is simply a loader that picks 
an interpreter based on a file’s signature.

The problem comes from a poor design choice in MIPS, which chose to use 
the same ABI type identifier for different ABI variants.

Thanks,
Laurent
