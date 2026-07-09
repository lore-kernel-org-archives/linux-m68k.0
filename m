Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3110F411697
	for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Jul 2026 11:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596051; cv=none; b=goV79NcDPINxdi+98kEEPdF6BgxQZqbnd4y3YmS/x/pqB5N1ttGAgwxzov4Ao4jSAOu3C8Q/EwFF6+KgrrYGzPGnbdQeg7tbZrMnRbzGVUAlN1SuQyKWWDcSoBXlJ9Sz2h2UeD6oAG5Qmp7Uow+mlM/SNwzsDyky0XaOvTvvaI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596051; c=relaxed/simple;
	bh=R+aFi5Oqdv0TDSr7wZR2WAPngeBl4pJ5LsNFoxiZF8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C7NsetSPneEZDu2q25KQg5coiHdpcKc65aBXuErjuf7me9LD6JyQQz+JBzrzFjTCbwPRDaJ/xKt0VLWYrhAlBit1JlOnUpkkgqzN4/bBDySritxh17qUdnKLnMYJJpSjjWOzIWrvXt2NVumzC1RAo/+9Dvi5Iiu63W7LogdKAxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iOWfjmK8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RaGJS2yb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iOWfjmK8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RaGJS2yb"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Awvqq1569624
	for <linux-m68k@lists.linux-m68k.org>; Thu, 9 Jul 2026 11:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E2VXUkO/1Nfb5542An87XlKwD9GRDm4PLC6Ooi7YQSk=; b=iOWfjmK8f8Y+DVJW
	EcnBVbRqoFetWpR+MvbIm0rNsCYEYiCVdv/jb+r7ZZuAst5pdACVTyVPX1hk4M4R
	UloW32yrnx0br0O0OZPBTsUXsGcPSz6fo0b7Z9SsSAlawkneGV3knPcGuKS4ecbQ
	qUgL7kJ1kZwezKuA1OHch6fG0wR/9IjoD0gaRXopgi656DtKQN7lmNG5nDcMpELo
	+2tydKrnvkk1mYPsPWN5nD/hRUDpTxejd9pRgo55t5XyFzKGEVSWfHJeObs1qXCX
	o+wuU7kKSC/wnWW5kZ8U0x7Pvu4fl9GPrm5rLmSBf6RmcKnNqHf8RgkEBJ09ZjsD
	t7y3cw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq34984-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jul 2026 11:20:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c01ff996dso17579721cf.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jul 2026 04:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783596048; x=1784200848; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E2VXUkO/1Nfb5542An87XlKwD9GRDm4PLC6Ooi7YQSk=;
        b=RaGJS2ybzCtV6eEh1tdU4/0q8Yqq0wqt+rAlf2Ay3ZxKUYoEq9Rs8buPqtYDdxFQcT
         fnmm6k4IGBk+wGojXfprAdlU0Gy7Q0v4rgWYxIhJV1NtA+ZLVE+HO2YC7dAyQS8IaNW6
         eUIlIU6KTYH8ElMLJ11eFNZJcvgRPV9ck6aYfQpWl1Jd6ii2pM3c2rK5p0NCKIyk9QZ0
         QDXaJYsSmqNSDRlsE+dBA0Hmk48j8EcdfHW+GNBodzmBRgD/kVvyxPnz5fxd9Fbay+qN
         mbacnkv84Ofp/iMP6VtjTm3xo5S9RR2KI+/3Kbwk+SZ/TFghxADZBzwOizZobGhSGnC2
         dDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783596048; x=1784200848;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E2VXUkO/1Nfb5542An87XlKwD9GRDm4PLC6Ooi7YQSk=;
        b=NSC7pygYWlOQNJNcmrRxalliAiP2Nk+ndJdIvzhmgwlsfXmXKaggX/fdGZCphEv2ts
         2nIZLJQdc+4Z2tYqZmohMaqde/vd+GHivupSgG9BsQjDkQ81cunUGOOQeVcagX/UQTVu
         rjOS1INU6eFy6iw9xkqzMl8ZJmHieh+xDZ6CUj6hdwbLzp8S+ppsksK/1N8KH+MYzlsM
         gkMV+glLp8nUC1hLLCrukotpPfNvZri7uNYhipQWJEOCdaDeg69qxBGAui+K3AcdOe4Q
         IBZF+JY8Mikb7fZWxeXk7W9uRuUEu/LclTkMkoBNri23+Umcp2QveXPtYCeu6x3emwN0
         U2rg==
X-Forwarded-Encrypted: i=1; AHgh+Rr3w+O6ool2u8iwzWpVuKgl0dMvYDJxXCfZgqeSFqUxzLVIFMCUCcw/FNJ0tesxztBMWOV3dcZcyNJ3@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxBSOcwA8dhvV+yc9EB+kYIA2YiHRBRU3EbMVF3zYFs8pnz2EnF
	TP7AwW/wEqtzHYxLVG3P+kmkbpquKbiaFbE6fjd1ijudXkLyozMW9+JAy8i+YG0kM4QSiGpIkhC
	GK30QeA3WkwrpPi53adgdINfXuRscvn5wMqKkvNYsL6REyWNbrBxYJJdMCIWXJ0daFBU6WS8=
X-Gm-Gg: AfdE7cn/GKPqn99pDs9hdcsVKdc4es/vXOtv9xhz39g92yOXbKfM/55pSOPPjir/fIw
	q7sXgClvDO52HtPk60w19vvap13nVvWDqEl1/RrQinuzdMgp1shttO14VOCRHQZqxcOpbtlvQT0
	a60K3h+21hjGRst8uQgwaImjZ8ngWqrJmjtaAd4u+Dj7TjUAGAV2TYDGewNmevX326Vrc9vTCO0
	zVk0YBKL8NVyPQFik58XSOcjRxIAHtw4BEBbh0dQeUOpYh5G3MlifKoJO77unKjUSKtUizY8yrE
	/nImRne3bZuVDf6kmwIsr+M9Wncsyqw67gnAb8Ujq5N7649OC6WglR+dVBC2SNpHLOYy8yckJOz
	yt+PDyeBrE1vNfzikIX9tUwOcnqQN9RARShKzZLPB+MHJwh5cpt9nP4ix+2GK7w==
X-Received: by 2002:a05:622a:251:b0:50b:4491:a2cf with SMTP id d75a77b69052e-51c8b30365emr71754831cf.27.1783596047571;
        Thu, 09 Jul 2026 04:20:47 -0700 (PDT)
X-Received: by 2002:a05:622a:251:b0:50b:4491:a2cf with SMTP id d75a77b69052e-51c8b30365emr71754181cf.27.1783596047072;
        Thu, 09 Jul 2026 04:20:47 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69acd1d32c6sm1861799a12.31.2026.07.09.04.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:20:46 -0700 (PDT)
Message-ID: <73b82749-2df3-4c12-bc2a-ff7628dc8292@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:20:43 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 10/18] entry: Use syscall number instead of rereading it
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
 <20260707190254.181086755@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707190254.181086755@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XU_2LB_XtsolbVlGFgI1xoipetF2yuYC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfXzLogH1CTt2R5
 01qfk58cc4UMA4osX4J/qFlB0G9m5IowPU+7YsJknZCu7FyHyQQMT/hoAmWVHcSHMOYv2DopDLV
 3TW7mZz2h5kAHEooZNckzgk6lNUDNpGhXC23UKnwnZpwBvts+ELA0VV0RqmfmfgSVMsPZbgditP
 YiEplHn/7X73nyrgr1HNc+bGKrUClO6r5UEBafHvU8hPHNRV5r5UorqASiO9RbU+x8+tb90kC0+
 QTrZABDDBGQeCDXKtU8YA5L3E/guvIX05bQrT/MIZra9jRdJNPFfHPZHqYxuA4rsiXjTGsN+uHO
 4W5gbpXz208d+Rw/3G8EIe65rHlG7RINDdt2DG+f+7rFLtLBpmSluCvkhbjyKRQp23s/N3eLQfj
 VbtAnsMps2mesw634BWwSyzkEM1pR4+27w+yW4r2R80Pzp5bQRuROBNa1SHPgE3hT8Gl8v2PZVg
 fFUtTOYag4HyFaXKQog==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX1icUHEfFS66y
 OSMCUyl6Tm5Mw7UX+cGJF4T5P4MW59skbzltrLracbthhNdrJAcmU/0O3UwDJDDrxCW0wm9VotG
 t4HkfJnLd99Ccg554mVT+taFt118ab0=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f8410 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=uucGcSui7XbmpEV0VHgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: XU_2LB_XtsolbVlGFgI1xoipetF2yuYC
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
> rseq_syscall_enter_work() is invoked before the syscall number can be
> modified. So there is no point in rereading it from pt_regs.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> ---
>   include/linux/entry-common.h |    9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)


