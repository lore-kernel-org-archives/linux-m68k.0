Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5643CBE96
	for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Jul 2026 11:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595820; cv=none; b=BfIbJTO5NRHfGxJJsscbtZNUjom59i5HG4ZgxSWDawgLhp6o9V5nONwnTA70XkpdgPJhYjXI3VZt9bEUYJWP2PA3ufUOC7H0ozeckgMJqSCFz3KBh2LW5bmoajlxLZW8JOz/n4met7aeHFoX8iqCibMwAbt6gmUxAbLFL9zPrgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595820; c=relaxed/simple;
	bh=tutnNf9YAg3H/q95A7Iik+KRuKDbYTmWKhCV2b/wa50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GMVkb8v3W0GTx/CGbbRvCjZ9rGVuZZA5NIrEHkfHbgDeYSvUYyY7sZSwWMjXwbX1ZjLB1uoxtfcennxD1lw/1Xx1ml9khwT2RZty0gfxudEZchZTU/uw+KLN07FwXv4bBtHM0Q6ltl+Y1sH71MfK0qw+VWV+ZnGjql932al16l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bZBcJAam; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HcXXwov2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bZBcJAam";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HcXXwov2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669AxOhm1484336
	for <linux-m68k@lists.linux-m68k.org>; Thu, 9 Jul 2026 11:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OP+BLCmg7XOu9OIoY1nTg278DC95imbUOhUvbiFMd6M=; b=bZBcJAam+ibbXFwx
	fYme4cr8sBqjGZ8/bhY813m3zZdemgRcv+ZZn5hEkMKaS7vw0Lsk0C+lZaMW/4N7
	48Ti3b9W5djrMW6C6sRvr/fRMwvlr3Xwdk0O8mST92o98b2JRkz34WzfXmdlRdyc
	+GNzKHdNyJRx4XFA9Y/FW2dL+68kjj0jsC9rEzLvB9U2wtPREHvCZncHnjBH0nco
	DqfIf8EOVkC/PQXn3R9FFwNfO+c4fAiAxBDB9r3vKIUe0k0qjSg4thZ00H8jr+97
	7VzXtBysfy4u+kGoa711kKXXJoacuD/Fbabaj49b91/ZVeI4dz7AgvccLaeW9YDn
	oHnuIA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1ydtamh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jul 2026 11:16:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1b4d961dso8967891cf.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jul 2026 04:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783595816; x=1784200616; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OP+BLCmg7XOu9OIoY1nTg278DC95imbUOhUvbiFMd6M=;
        b=HcXXwov2/iQNBqmsrqV9FCV2Cjg2nMdxHLo0QyT45jPYeFj+x6E4QBg9XGkXFAo6pK
         Q5KTmissjj1xc3d+h51b8NeQeHGJAYtMldjpwd+GYyDWUMSXHXMYCskMNs5LT1XCIuxo
         Bf1aEbn9vXbF/ti3/qWkNAfUAj/pi6V3YboHV0mLYnGso/8G8yCtSRRdSB6iyqx+UJof
         8+LK0C87ov1vbMH9EVw9JyvAwZLVo2WoJm6Er9nI69WFjLDFZHRg06Li/ApbRyLqixEN
         DSwcMaMCO5vMGrwd8TXitQSKHRwriC5oMO1s7IlSbxRX5yrL1Ak4J0Rk8z0grMMG38RL
         A9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783595816; x=1784200616;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OP+BLCmg7XOu9OIoY1nTg278DC95imbUOhUvbiFMd6M=;
        b=MBn3jPXR6XDuNRSbteGtWTJD1BKi/Fh75dG3R+AU569nx5WSzo72aF6SUcPscXHZQ2
         u+psHCXwmYtKLUghCZGhemAr0aB6ZjFETbDywlT03H/Hu5AvCtcCTnEZaSZyg/cCZmZA
         KGyyds0dkpYSJqBbkqhbklD4frKdTfqsXjGmr3KYpiyQZmOOwIXIOv0xYuLtYCncIDDc
         hCf6dxy9i+kzMahpkKSzG8F4fYNJ+bSljBZrlFYt+4NnC0F8hRTwEHHuB2a7qargmfrg
         Qv4ohsGSnZ6dJgBH2JRNnEdbg3ArJpQ5E/NGHD4Sai078vqhhZaNtR0eGo6Jb9Mm53Xi
         M/Pw==
X-Forwarded-Encrypted: i=1; AHgh+RrgmlKx11jXuZHhH121RMkDLjuTvBrE+4GaNkyk+YJdjpMla8xPQPHA3oAifuhpuEVEZoCTqKC1n62e@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyRpAJz52YbCZgx88Vr7+7gKV7LCn6yEIOj/2PlH/tB7lVZgXpa
	ZSFTc2pPPt5wfeCYX4xB4ryFwwDKagj5rgWWO0D3psLc9OKTMmoYK7avonNq+KZywm1PXHQzD6A
	1lYIRBiYkqb5/ocQSw1TR7FIXeX2wcTeh6/jKbldZBUJNd+/3y5eJw9TzA1nOygOkBSpsOPc=
X-Gm-Gg: AfdE7cmXJn1aLePKFEeLoxR/P2nI2mx5vz4WCWvfoD7lAVFd2nyopfhlq02eRDR70jT
	fUmox81MZspBGTCh1C3iFUyNyDsmtmnJR8zXFUu28Fg9Im3O4IyBHVHY+/e2akIEC/HYEqW3RjA
	jMqb42KDnPzqJGQYkI4T/750uAxNPfk3Pg2s+5jdCz/pEsBX8mloGEQ31FisEf0c6pBNaWaK+v2
	hejrk+IfB0RJkNjL2ZgbrRYb7QEAt7HSWZYVFyPHDq8Sr2qxUActlcTAX5x/FBkcvoTIl7qN6eS
	yrHIGNr/3XKDxA2pKD2uX0u2Z8/iav75YFltyNRVucdiBAyoerqVAISstRE1LSRGVMBGUwQoX4D
	3fk8HZniC2JCLIx5ZOXAXv1aERZtw5n8JNB4DgHW92rNQ72DzFPeWJZAcWkZH9A==
X-Received: by 2002:a05:622a:1cce:b0:51c:558:cbbd with SMTP id d75a77b69052e-51c9ba21545mr21236491cf.41.1783595815669;
        Thu, 09 Jul 2026 04:16:55 -0700 (PDT)
X-Received: by 2002:a05:622a:1cce:b0:51c:558:cbbd with SMTP id d75a77b69052e-51c9ba21545mr21236071cf.41.1783595815288;
        Thu, 09 Jul 2026 04:16:55 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d8410sm51612968f8f.15.2026.07.09.04.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:16:54 -0700 (PDT)
Message-ID: <b2ca1416-e2c1-46ac-8a26-ce671c76883f@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:16:51 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 06/18] riscv/syscall: Use
 syscall_enter_from_user_mode_randomize_stack()
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        loongarch@lists.linux.dev, Sven Schnelle <svens@linux.ibm.com>,
        linux-s390@vger.kernel.org, x86@kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
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
 <20260707190253.974626922@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707190253.974626922@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX/VgCyXGi/ui5
 DhZY8v6zXLCHKZDpQCu0zkxF5Men2rRT0Ltr71iP+TVFbKLspbTfEYNa2yY5RNv69Udzpl6zrkS
 p9jvomM0/xozOiVDBmZyUtOMgpjjiT0=
X-Proofpoint-ORIG-GUID: q_RLDk5SaNsR7G4dJof-_4YbP1pIbGyj
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4f8328 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=_O3DOGVWAAAA:8 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=DoJJhcVa48uSEvU2-xUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=2TKV-7w1aU1AVAwN0oqT:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: q_RLDk5SaNsR7G4dJof-_4YbP1pIbGyj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX+gLM3+b8jvIx
 wlZfS55ThQOKUFHsvqE6J1ghRS9yEm8oTJ6D7XfaG5uuMhJz7npbOKYmMeRsUVSfNZFXQ67pCKl
 en9t1ZOPVWkNGZhegQxQFG21l+e2jH2fdTcVcl3YyqnA3nXZTiOm7wwtiPf9PizhVwt1Dqv9gYx
 L+WyHYigqWOAotOup0GewxYOOlCTexGleAUlXGHruhNJj3dKpL5j3yg9t54Lla9uAc1hdkhgZW0
 VuZxU8t2cENWF9niez2yn6YPu640enAT9AejVc8uwZv1I74Mpss/Dm6JyG4Ay9aPRUbAakpUUZI
 mwCu4TAEdNMBO+LpMAM6+supyOB2p50xmLJ3+kgAdyy4SJ3oXvzEv+0XUIIZVBK5vNdKzAzpGwi
 IFHoU3YmuCB/JybPFxFuPeMSYKN1KzCxBVwmjeKpVqLecW9TwKu4ONWMaAZ98uqWZnp+eI9DOAl
 QGuvfL+blKENtTnBjgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090108

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
> Cc: Paul Walmsley <pjw@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: linux-riscv@lists.infradead.org
> ---
>   arch/riscv/kernel/traps.c |    5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
