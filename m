Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D32E3EB113
	for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Jul 2026 11:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595896; cv=none; b=P9hH9NLY4F/mABGNwINWS6qF4G/an8+82KO+k4QmKJJZac9FKqpb09ov1X8k6WkSMye1xfbwgkoDjveCZ7XEjI3mLi3Q+pUbha3TrTmugBOIuEeXxfzNiNu0HO67kR/R5mf0zH59KOqJ3e5hNf5NsGLi9HnqNO8DrACQQsynUnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595896; c=relaxed/simple;
	bh=JIbY68pv3tLScCT8hJ5wD/twH9VZZ6GeM09XMVAWRO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n/7CHcy/BH9nKioTlZIz3gb4q//THWrcyrlQ85bTFDAKxPVqL7OYVyUT1pmM0JBuDHMgUo9mf7nMZmn0y90+0aKLTjy4WnkSOOIV1AwioRMcJX8DcRLycYa47g8yI5tJzrTJ0Uks9ZYrPr6ySTOydctCiiIMS03Eyxl7+WP7uaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fyY0pNu1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ocsm2I8b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fyY0pNu1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ocsm2I8b"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Ax8tm1574653
	for <linux-m68k@lists.linux-m68k.org>; Thu, 9 Jul 2026 11:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vihb0TqYNakYFNkvFgdqTcLu+5oolASwgMBC4TOzm2s=; b=fyY0pNu1SYakkEnc
	jiua1Bz59Z/HxTO6ZZj7/6VoWVtUtY1ICmo9H1Pd2QjrZWC8gJfOm9T5qkA9XEc9
	zZ/LvhTR9YL1D4FRKeeUPeBJzIH2ig7MkQc5n0wn0ncq5EOUUpyCj9xucWrHafNA
	Mhaf5VX3wvgWTqgyvze8xNYS1i224SoOljNif2MkoC4501PXlkZEU2tlj13tOCVF
	k1OcXw5rO9V9U6F4nqjFTDFlr4SsHrosvOnlojjBDdlvWI+//0MRkxof7+sUSdLM
	DMKQPcPOu2w9XU1PRa+80kn2vAWE27oY8QNhmoRslamfrHh0e5dTRzAtOzXXQfwX
	yQEHaQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9urvub90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jul 2026 11:18:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0408254aso9399871cf.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jul 2026 04:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783595889; x=1784200689; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vihb0TqYNakYFNkvFgdqTcLu+5oolASwgMBC4TOzm2s=;
        b=Ocsm2I8bsxNOQ06MwCpcvNeoarAleq0waHwzRMHl+3Pj9UEXi7wfUE9DYNK/cKxkEx
         9//hc0saW/4l8XeWHLYWcZwP9C8EZu4cepocz8ZtnwbTD0LrJodVjaCwveHRH1l+qSsV
         LgXPHKM3LaJkk5mF9T2CVMFWoPl+60HriM5iYtAsPjDQkJ0nJNC7bHtjBV3xrfmcdjtD
         newQgyk9js5kw2y02EuXHmfhOcmu2A8Lj65lpbGOxmycH9lY4hYiytrGvxZCUY3Eo/5r
         AetYegmmrP1l28tj024a3upH66K6qI2tZbpA4uvEo9oLS1nhMCQHVK0dPoLinCMEDfYV
         MGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783595889; x=1784200689;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vihb0TqYNakYFNkvFgdqTcLu+5oolASwgMBC4TOzm2s=;
        b=mzGSyMcEg03mpMB3VIuzRiDnd8liaQnmMB76m+nBcxzxath04F8aiCd7ZhnfSBSJl4
         LrISCCoU83gR5tgMCPQZ0+72R7WzXDb9IDKcBxEeCdHh3uqpO0PSmy26i3kcxOhQsake
         8IUbq199QWiRszL5/BLGkeZ3qQFyZUnhXW/Kai2Dxkxv5oE9OLp9a2hOdPhhw2hn3MyM
         u1nwoZ863XQYp7/i+ptJ6A+TO9H3DRiFfSqThoSBPIoaAY6ifiUN5phJvP1Gk+E1zpHC
         mmYSQwJIZFI1CFZENB9qdOV1DeCMrm1aRcrKMomLcPOSq238oYzVPQIU6YfVIRDJOjjw
         U6Ug==
X-Forwarded-Encrypted: i=1; AHgh+RoA/xNlAyfYJINY2FpAR18xWa4rhmOhb+hvF2qSNaWXIpDm+ywt5TCRtkfgZT8AjDHZs2JY07pbuxwK@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwKp04VjtaaqmEiLokO0x2wqWr4YcDla+EJ87lrVL2KGf030OVx
	YS4/g5CUulk2i+o6Jy37cUVD/LCTwKBFST8pzgWcRwyGkQ9zBUkajxlfW39xsyKWZu79yjDrbJ3
	UHLo8MEM6C/rtAQ5j4d28YBYbiNbCp/mBR9BwaROzA8XMaGDGEHlprieOH4bG56hoCvtEETo=
X-Gm-Gg: AfdE7cm0z2yW480/bgdVTvPWUa2hHTW0+4/qgPb4VqFYfaJa27Fdn/hR0otW8DCxyTJ
	2BoxgOpdTBL4QJGpliNW46JjwsIoRRGmzECwZ+FnGCZSTElCwEFGpROs8K+iIug0fyNlOCUvZDY
	fT/WL0h3hNgYnWJhY1OOYULDRLM4C2tg98CUd6iM4u4F9676lGz5Xton72czfIS2FymGJBvCAS0
	6VoyVz0K/byTPhUVtOzSxU5WivwxVLRfKHvx1Wbm6tfpkJIyhPRzMvWp3WtrCOGNCWsANhUmSyh
	wgVIbIevXBoTq89jPdD8h+9zltjUcA2vupWmmNwYs+v1F4Ab1nTMHRgsg++kLMnibHi+oap0HZ0
	RZMwSTkEM5b2bT/ntKptwfeUP+Qsaru393ycdZO/GkzWe+C+qyhzRT68cXUPGxg==
X-Received: by 2002:ac8:5d06:0:b0:51c:98f:f282 with SMTP id d75a77b69052e-51c9b9c9812mr22453931cf.27.1783595888679;
        Thu, 09 Jul 2026 04:18:08 -0700 (PDT)
X-Received: by 2002:ac8:5d06:0:b0:51c:98f:f282 with SMTP id d75a77b69052e-51c9b9c9812mr22453591cf.27.1783595888214;
        Thu, 09 Jul 2026 04:18:08 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6d53absm53036115e9.6.2026.07.09.04.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:18:07 -0700 (PDT)
Message-ID: <e89995a7-0da5-4581-bce0-5dafc377e9b9@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:18:04 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 08/18] x86/syscall: Use
 [syscall_]enter_from_user_mode_randomize_stack()
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
        Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
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
 <20260707190254.079478122@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707190254.079478122@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX9a82PTsjX36O
 crZqK+9EMWuv0PXoLrpDwEp0nwnjjS51MR3VOWhOM32vtlETq1+g7pC2jrgbVuHViz9NWLnDZS5
 bXUCs4+Ej7HcVlvfJcm8xNzkoV59FT4=
X-Proofpoint-GUID: qv0JllZUaTaRaNtiguz50HYXrkCtJOPx
X-Proofpoint-ORIG-GUID: qv0JllZUaTaRaNtiguz50HYXrkCtJOPx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX67UAHE+mWUpd
 eML7zWfsJxA/TkwFEQQb1ScY6o67DlU2ZD8e93Z2ahZGC0CJaLAURl6yPKkr/reinOcwycuf0np
 6H8nBa6YmVjDR4a7c1eGmpx1ijlPeTsC9YPP9L43198oeDln2UlmXs4OndrPikxGigC0S73z5OO
 GIYvt/lPQStC5feTy+h0Z6C3ca87tByFxAaJHvjnOWfEfLG/8dBph40ilvpjchQm+CkRivuWhO9
 VHvhsl2QKk0tT/Gc4sQYed3QjRT0N374PpyYqBpYcGRJOm/laRVND9nkpVDVC4/HYEXh+dzxOE6
 6txME7r8iE53DUv56ODHbV4OmWey/8g7Rx9tdimuJc4kl9zwTJg9lEL8M01MCMG4UsCEGUD+88W
 BdXU4w5BiqOpYwcncHiDskaqRYIzIuvD/fqm608rXXXZkod9mpr4R7W4gbfYNd8cByrJppSw6S2
 3MSPzsXag4wL4dbFshw==
X-Authority-Analysis: v=2.4 cv=H43rBeYi c=1 sm=1 tr=0 ts=6a4f8375 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wOAZ5We2mjvvK_q5lLMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090108

On 7/7/26 21:06, Thomas Gleixner wrote:
> These functions integrate the stack randomization.
> 
> syscall_enter_from_user_mode_randomize_stack() has the advantage that the
> randomization happens early right after enter_from_user_mode().
> 
> In both cases also the overhead of get/put_cpu_var() in
> add_random_kstack_offset() is avoided.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: x86@kernel.org
> ---
>   arch/x86/entry/syscall_32.c         |   19 +++++--------------
>   arch/x86/entry/syscall_64.c         |    3 +--
>   arch/x86/include/asm/entry-common.h |    1 -
>   3 files changed, 6 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
