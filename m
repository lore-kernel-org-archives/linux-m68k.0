Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A38931ED83
	for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Jul 2026 11:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595589; cv=none; b=iX1927r7ZKlXbK30iwHapjJYLkfZg3YPgFA9rQakwyrCPfgpFTqWM/Undlr6Ma6N6Mku8BNzDYq+qe6VtLdMx380Cnl0/kTHXYlPhMpYEL+1xUiQyP7XAoYX3SMezHN3anyhXjI0muKEFyHhsQwd/boJAgeAEYgDdf+DykCm51o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595589; c=relaxed/simple;
	bh=HqXh4BfYQkZLyAofgdtRXqw9mAcQUWbFiU48fKsf49U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cWIetEIDO4OUutGWCt03NVUB++OBuNSlgaxCYDBz+SqDPzQ4U9W05xCRKfqTa2GB6UFn5qQJGddWSYwmt5ZihulVNhD5xR0HmGuGo/4pzYmkq5VM5e+SQpTOLYxFRCjDUzL5ScJKiQ/2zeHcyJu7lOW5PCNQzHBeFDaTtafQhYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jqvWJK8P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hEf0D7v3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jqvWJK8P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hEf0D7v3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669AxYi21619431
	for <linux-m68k@lists.linux-m68k.org>; Thu, 9 Jul 2026 11:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tx1kSZXz579iItxHsi1/8Nt3maK8vpLohSpfVXF4Ysw=; b=jqvWJK8PLEi8s+Po
	PkAhOcF1EZ0TGn8umnL5kgryJ/tFquXm2xFzKz63mEvAAckXJG2v/bBhmyd/J+vv
	w606gHPQkOOhu8auM9bbQnd68PLYN5DhMVRn/TQO3SYM9ZXEOEAB8F2FTaHvyyzL
	/gj6GXZOaZ7Kqn5MccKMlGU9Y/8NaD7WUS1XOInbClq4x0wSv71WFJfHopsmfL88
	joRiOO1NBxKuiVXV4p/tSPunQ9pAf4nwUwhwVoGhXqa2d3YUXy3NiFuuL84Sr5z0
	sFBM3VIfsHX5R32LvKrkWCid7sj7it6qPECFAQp6EaOHyXV68SwSVXRcZbVTi1ag
	vIF6OQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqsbx0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jul 2026 11:13:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e38fbc5so90588185a.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jul 2026 04:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783595583; x=1784200383; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tx1kSZXz579iItxHsi1/8Nt3maK8vpLohSpfVXF4Ysw=;
        b=hEf0D7v3RVqFYaoWEIBw8t997aA7OQOsSGd35i1jDz6f5SqKZHGDjJkEacM8hdJ8Vo
         AY2DCiYbOBnHvpvV1u9ZKQk8PXbML8SRNijLrA2R9qMVKkTsSmlDqD3WAdMFbmiBcuGB
         fA6ijeUk1XdZYn6BZoi98niskh83xg/jkkIAxw+LIja/AEYq3VfnD7Tm96TbRtDOxkYC
         ByzK3+qdF+ET5buoyn4PoR4E0+HjIO3lbW6eEf6Rtuz+kOE3spq2VewRV6ms0dqw0NXJ
         SBbAVJExJPENkqcoy8RVUfMTCHWRRH5lk6EH0MbBehHlT0AHkiACGudO2iJodGJeQDxt
         PgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783595583; x=1784200383;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tx1kSZXz579iItxHsi1/8Nt3maK8vpLohSpfVXF4Ysw=;
        b=Dvqiz6nPEz7GLENxxWKjQkNs2xSrzcHYhPXGAfurAJOiuv2BT1JfK9ItEsdT7PEG7x
         MpdeHAPVJC3NMc1SwKES+upuMhymB7DZSuO0+D9TRoDt22zqnYo7H2qC05tkOHJYTPe2
         aowekt1rbPNQ9WzGDZmGGcqYCsIA6I1oMDKpsCTkOyyNVFBX0JiLJ0iPT4tIrCdi/Qu6
         YgmKoLtxm4E1LHAdq3g/NPalP2Z6ZmkOoqdiz4hJ6RYTgmX7NZmIeuqvTV2pE3lvs7qX
         lr28msshDW27H0poXqlxyqFV+fUdvr+q10Z6q4Dx3R7Ej/WnTwpo5R3WS3EArNElyPgg
         benQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+lJLtSFXx6JRjrL2FQIzhAQ1cYBtUYrN1d5ljRmtVy6lKsXwgQfacoAj/wQEgezhQiptjc7Fp2wrE@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxPEIhV39trZXvzB/00JoLeORBwZA2b9aV3sO45OqHgfDf4i3x1
	0c57FaYPhydo3HVKR+eUYhbD9RC53fgrsknbyFQoJbA5RHCESArdAzaoAxDYVOvwIsTJLV9M0Rk
	5/YaYZtLzbVta8rpAr8TgOrSoWazBTWLwtSUc4mNjSKu4OfvM2djlREczB7KTLP9MOAvJ6kM=
X-Gm-Gg: AfdE7ck5EwtXC71/WuHZ2MDOObEqUnD+c2DRR3ud6+vUu0NAJ9FFRRzN3QtD3rEaQZQ
	3h8MsKlziN4shZObSWipLC/PBm6KsGR8VO4Si261CYn+XHWMuWn+RzXoa0XbpXq8niJsBWIyHF9
	4ZVRrxFK1IT/ZnCmKjK+npOtsVVOmVrwzqEKvTSEOMCHcBZZ5B99y7LEwWjFeVTgiZkHu1wAK29
	A1eN4ZR3NM3l5TtugAf5iQLeJgdXhLk7r5tUqT82+TV+dO47f2zrF2LbaiQtWIbY8cm21EADVaJ
	jWHqbfjUyJ/CWZHrzagKmulS6y9SPKBmm6mcds8nrmfeNb7gWz5u5+eqsyzoGsk0QjswMULxobe
	LRVHH29aCQPx7xG5ZFRBCDN4EwssQy9If0r9azFbkNX8LLO4OvWQGnUs+46tgSA==
X-Received: by 2002:ac8:7d14:0:b0:517:61d5:2f7b with SMTP id d75a77b69052e-51c8b4d596amr63974781cf.56.1783595582999;
        Thu, 09 Jul 2026 04:13:02 -0700 (PDT)
X-Received: by 2002:ac8:7d14:0:b0:517:61d5:2f7b with SMTP id d75a77b69052e-51c8b4d596amr63973951cf.56.1783595582395;
        Thu, 09 Jul 2026 04:13:02 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f213e8sm48543085f8f.34.2026.07.09.04.12.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:13:01 -0700 (PDT)
Message-ID: <835e2f62-3b66-45d4-a614-dc2198a715ad@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:12:57 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 01/18] powerpc: Move stack randomization after
 syscall_enter_from_user_mode()
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>,
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
 <20260707190253.718191130@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707190253.718191130@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX73LL5xUTGIpH
 dcuMi/J5nYW0m0Y2PEHb5qRMV4jLWkyvNpVuHhXKYQPJ9R2gVLnIWxAYmiqktOybh/Y1uENrkpX
 pJWtkKt2+DatmV0zaPhG+EaSPgfwau4=
X-Proofpoint-GUID: oDAcT4x_j_w7UrsjnF7aALukO34O72FR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX+01I0XOBahQ+
 GS2pSceHOOkas0PW2fZa+ZUqtG/PW25OivFixUvujVcHODUaK/RnhqRQl4Zr8IhI6WuVSZUooVS
 sEHRD71B6UA+f5UnelcTbsBCkbLQVFS8TjJ96ayjKxezUiaJBXpkIPC7IVpw0gMfVotByujpb+n
 Piv65/ebA8COyvZ56Ti8W7uw7kjhgXGflHvHn5S9oQk/tJtQO5w3AjGhIBPIZe8Fib6/RA5Hf02
 IkOrZyzqESMEO7nTz65AUw85NMhYm8HhuK9JYpdruZjlwE9T5wF+I+Ohbbx8Yj8x0XOR+pXAwVH
 vWG1qBOcEpkMYg1aU8NZShncvyWjNi+UmM6kkLjqlJHDMTb550Cb9KUOb9Tf7tfSsEWIReNY53I
 Fn+K4wpufGHvVKsMzfuv6OqOX+Z929v32YnQpR418aWRl+MYmri3UdZMNmSuX/iCmLMoPkt0vcW
 9+AEVyplQ8rY/jHGp+Q==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4f823f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=voM4FWlXAAAA:8 a=EUspDBNiAAAA:8
 a=63ny2n9c4_t8xnV3ltYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: oDAcT4x_j_w7UrsjnF7aALukO34O72FR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090108

On 7/7/26 21:05, Thomas Gleixner wrote:
> add_random_kstack_offset() is invoked before syscall_enter_from_user_mode()
> establishes state. That's wrong because add_random_kstack_offset() calls
> into instrumentable code.
> 
> Move it after syscall_enter_from_user_mode() to ensure that state is
> correctly established.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>   arch/powerpc/kernel/syscall.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/arch/powerpc/kernel/syscall.c
> +++ b/arch/powerpc/kernel/syscall.c
> @@ -19,8 +19,8 @@ notrace long system_call_exception(struc
>   	long ret;
>   	syscall_fn f;
>   
> -	add_random_kstack_offset();
>   	r0 = syscall_enter_from_user_mode(regs, r0);
> +	add_random_kstack_offset();
>   
>   	if (unlikely(r0 >= NR_syscalls)) {
>   		if (unlikely(trap_is_unsupported_scv(regs))) {
> 
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
