Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C727D40FDAA
	for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Jul 2026 11:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595763; cv=none; b=pZULXlo+r8Vxzt+s2B1B3bCG77L2fxh+MQxu3miJ0YAdol0h0e69p98Z4FotsUWMeDkh54vY9VJwOWY9gPERXsqnroUN/1A5++5GBQjd+4rXft/BXgoXVj5HZ6c2pGGlobN297SkJSEoyVTj3itKdRmVkGzDky21skvF913/JEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595763; c=relaxed/simple;
	bh=2OZyqeCMlAjx4K2K+b/k9iOm6BK8Cqfe058LfZSp27I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KQEOTOVXPRxu4qkgqavJ3sX3O+TBh4sGeaEigJIDt2x7+d98R3ugQTAAShsZb16dfC/BK/icInKNPaTeQRhAqvGR0DB9GagmihFBvfnpUl53RO9yd8hmNlfdRL2k2oZbSHoHJ+l2Sy4XBHHtic37tIbDxSAQQRcLaaLjWLCa4P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ULLpdAqj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YdRi36z5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ULLpdAqj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YdRi36z5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Awvmu1569618
	for <linux-m68k@lists.linux-m68k.org>; Thu, 9 Jul 2026 11:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y/QNMVWz2zbU62zSNYrI+1kG+0GMg+VxTcjcEiOFHtg=; b=ULLpdAqjhcPbhl+a
	9wkFVF2/lY0nTNUibaezE3oRQ6lteQ4HDVcOfqHDE7vtflCsPuubuaBt22suHv5C
	J/GboNexxusvk46SeLD4YSCgJibhGpTyBp7Ew2CmZmE5Kc85FL5xmUGbwX2SNRRm
	AUKTk+C5LBwuGwFJB3/1RH6SX3HPCEtPeI30OoMKGubID5ux/F8g5HbF1COPW79s
	OzhxWi76MMCFcorNKYBBg01ItlLF46P4rAQRFOMzzGhz1/Bz8zCwIh87EUtM9Vze
	DADpxILacbIASbBx5FZNfW6HGEmYrVnOynweeKBYk1Yd0I8v8nqfQQ/58XsDZx94
	8Wm00w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq348jw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jul 2026 11:15:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bec738909so8045261cf.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jul 2026 04:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783595759; x=1784200559; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y/QNMVWz2zbU62zSNYrI+1kG+0GMg+VxTcjcEiOFHtg=;
        b=YdRi36z5bzzp8ghROK86sHdA9P0RZdUt636wVwhUnEz8cW7Dt/BTSFLuVnjWNzkK+Q
         5Iai+/ocwWraW4ZVMrRXkWGCoCZdtKkGKxrLAPK9R/SV890UvLmTYpInpFRUXtGWd519
         +e19WOQ1CPJm4OKc5L4b60xADgET9P2P+ARIn0gYfA8wpm3uoW02f7BZjqzOfUU7TadW
         Y+/vjoj5OfOt1D16pGIvTEhFMAPEu5rZ37hrCUwJq2qEqwm04sj5inn24zfygdt/om7E
         CG9IhojmBQL71kFrZ/tRwOahQM3b0ULbOs8k0QM7oyDxJA/KKg106x7YTQ5zzUTsiKf6
         tYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783595759; x=1784200559;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y/QNMVWz2zbU62zSNYrI+1kG+0GMg+VxTcjcEiOFHtg=;
        b=mRicjAvAugry9gOyZOKRyyp9EJZ2YjHlfSdVrITrx6MXC1GaY3FY/RfW7SlnbuYbOD
         IzXkgT0bYkH5UzB3vfldzhm6gnNC0RZQOWZuOwcH17fbq4HGH70wnPPbwTV2g/yAhn19
         AsOGGa4EFRQak3MCt9Q/qXhupHBW2H97tMuV2sBpYJrdZChdlqz5ULcU02C8q5wfnFpQ
         0FbdNr6sc/Pj2APeMBzPyoaviQaN/hhD4Km2lxbcAgGJjKhLkgtFACayX5HzD8N/yTaS
         dOcNCYyAE3O5IvTMpl0SK/vLb4VAQyutJcMGrg9Q1ef6RBReP9Oj+9MSFe+WH2QUfuy7
         ZhYA==
X-Forwarded-Encrypted: i=1; AHgh+RrzUalXRapTmHvi/fcMeSwpB5Q2SlY4z8WvB4jgSmuCF8QBXJ77sfRTyJaHNyq/PR06VyifoSOvQCVM@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwoflnLOPW1ube+0SNzyo3Q0i54swcjQy2gX+FAvFxhslXeIKSl
	pihhOV47XIp+2lit5ul98oM0KogXIum/o4ktln+nyUmJYiMA/cNFz352tH3cHE1qJtD+Rdhmp56
	LmazToURWyjrJjgA8pN40YcLl6V9hffk7ywetKXN/pTRWiUWUI3pghYo25leeqlU2wSF3Oeo=
X-Gm-Gg: AfdE7clm4fHs6iUF72urLc+1ky6F1b/IastyQK5hkLpfOrO2NbJ1UHuVmj2VTE7PkAq
	6b7t4JrnQGDlG/j+ZRu2Etqs6Z6j5wnCFOM5xa6q4rBkTP1mNa3DqDUR6N0D8iXR+Ot8o5TRT6I
	RtxxKOAmHvSyOL4aOH3eivoIVgnWNZI+7aQHJpJaZbAMFWi0CGybwfKsVBtocm6rAWLbB291O2E
	q2z7XbzluSMnMBARJF9EjWs9I4lIT1Y6FVOBpvy0wlTK7GMwu/6zCV2jDsUy2eJJaeFxR0QbZfP
	9pxmQYgnGgmCqiBjaZyfJM7zPnCAn9vuDvvaHkVVjvn5E0yc7zL5BRrBY+YHP59zZaYJHE0IuE0
	NasOfbTNOBUu6X0omvuTG7mzNzkXHZKveJYU0qKvjuwUnyTUb4RByXw0j4QqHjQ==
X-Received: by 2002:a05:622a:1113:b0:51c:1b3d:fe62 with SMTP id d75a77b69052e-51c8b2dbe87mr68191861cf.28.1783595759115;
        Thu, 09 Jul 2026 04:15:59 -0700 (PDT)
X-Received: by 2002:a05:622a:1113:b0:51c:1b3d:fe62 with SMTP id d75a77b69052e-51c8b2dbe87mr68191231cf.28.1783595758685;
        Thu, 09 Jul 2026 04:15:58 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b126sm50274140f8f.24.2026.07.09.04.15.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:15:57 -0700 (PDT)
Message-ID: <cf26fe68-5a8d-4d6e-b9f9-d69faa8a6012@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:15:55 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 04/18] loongarch/syscall: Use
 syscall_enter_from_user_mode_randomize_stack()
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
        Huacai Chen
 <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
        Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
        x86@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Jinjie Ruan <ruanjinjie@huawei.com>, Andy Lutomirski <luto@kernel.org>,
        Oleg Nesterov <oleg@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Helge Deller
 <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>,
        linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>,
        Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>,
        Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
        linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch@vger.kernel.org,
        =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20260707181957.433213175@kernel.org>
 <20260707190253.865955911@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707190253.865955911@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2iQ8lBSjB9Ulxuph6OODflRn_GxGCRiR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX0sU+JZrY7h/f
 AbUSRuKsxR2zV4D0xWskhNzvu/qx/VkklnqaERcqD8gQriZKdgrS7DXtAYg/M51wpHDGeCG/nRz
 /5xETbD/KFrdUQO6yoREK1vl2z12XmCGwWdipCXfBbNgGGh60LsdQNyniXRg6zEwtqqwQqTeSOI
 t61llidl/t+1IomrTQJOyIQffxjQWsyjJBCtbtmnNL9x/klJ9C4ZUNkEvE1B3WCAmwSJQnh6bow
 gnzUg81wONpJtoQ+PVTwbwgKBHEr6a7gPgY3Hd0DQF25QitvzAv7o47V9g/b+hNhuUhT+LdYOdj
 eWk8RiaI2B7xQIvr7Ue8zO1wgT2DOjeCl2uhjpC1xZirVL1qFtAfSb7+SGClHg4XcRhHn7KqlwU
 /SLkDieGKsb+i6am91c2zCs8nUdPGAsuz/k1EvXsk1V78nLeUQJOoYa6EmRWtIQwLIbSPJfK6YI
 qwCDsioYfaGgiq/PTrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfXx1A2jXbo9jYv
 x1PifyGOTesz8lV/mV+EwF5bS4WSGqTX+hAinW1V5MhVgFzYhjWIFoHrqjJ4fYYxhUNyQzyG6yu
 5lwQlOocynljjXlclCv0GAGNSoXeVCI=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f82ef cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DoJJhcVa48uSEvU2-xUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 2iQ8lBSjB9Ulxuph6OODflRn_GxGCRiR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090108

On 7/7/26 21:06, Thomas Gleixner wrote:
> syscall_enter_from_user_mode_randomize_stack() replaces
> syscall_enter_from_user_mode() and the subsequent invocation of
> add_random_kstack_offset().
> 
> The advantage is that it applies the stack randomization right after
> enter_from_user_mode() and thereby avoids the overhead of get/put_cpu_var()
> as that code is invoked with interrupts disabled.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: loongarch@lists.linux.dev
> ---
>   arch/loongarch/kernel/syscall.c |    5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

