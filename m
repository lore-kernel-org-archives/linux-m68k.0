Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CA8410D36
	for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Jul 2026 11:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595791; cv=none; b=GqaQ8Y8ZJAMU7g10szFT5NvnuSKJCd4oA0A6CNP35G+Of1SBuScT8KW64cp2wqRr4Uv/oUP218RO6PV/SH0Yu15LNd159Yuxq1Av/tdmdPTYflsBHzNvGGRaPaSArgGajq2hfMAo/QwZnbN509VfpdDPSc/yff4DU7PdelcO798=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595791; c=relaxed/simple;
	bh=khehXiLJiCSvkVxdEgobbE7CP/Mf6o7o044NnO1eP4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lxMzf8m5nZbK5gnVhfz0YYm1pKIdrdJEgMi7FkSQr2tMPmbRnskkQI9lHamSaIvRdZ53UfL3PnmaJmCAdRPDstWf/vClRbw0ENTdl/SpgUnlN22ozi8D7V1NeJH0sK9a5AKOIqzVq8V9Zoes6Wh2A24m0n1nS/QoSV9TJQM8E7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i6Z+l6cz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BU8Gx3OR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i6Z+l6cz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BU8Gx3OR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669AxCAr1521422
	for <linux-m68k@lists.linux-m68k.org>; Thu, 9 Jul 2026 11:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lQNxQw6rO9fLZuzYn+ybwybDNA8F5Y/5chm6JwlKasE=; b=i6Z+l6cz0ADxMir5
	PP7gquUEvOGqieG+lf85k6tqb18XN99Vb/XbQueU32Nh4DFYdvrk7j7dFspHsXdS
	Cy7w+CsZ/lI338HKy004q1RoAkSXUYbZGedzGtf6/R1/0ogaog7QiT/r0AH6uhhW
	EGub/EAkoHwsQwiSwXadb/oYPAyoLb8nSMPbvA5/LtqwV8trHzPhgOS4T3OKYTVp
	y5/p6PBjRcCgw7xpwdmKpUFT5d7kIO23k48hxSlZ8uRGHGGnWe45xji+gjzdUnc9
	Wyi3IdVy9kYk4bNta4UN3ybii4hmT7hogdBdgOfzXklVyIt2UwzF5HAMNiWsF/IF
	edCxbw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwbw0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jul 2026 11:16:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c20762d21so20472651cf.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jul 2026 04:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783595786; x=1784200586; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lQNxQw6rO9fLZuzYn+ybwybDNA8F5Y/5chm6JwlKasE=;
        b=BU8Gx3ORtS4Yo4f9Ra9lLbQb/2LJTEaL36U4oJdL5FpVHfVujUTjUnIUzYyh9EcpcK
         huMahaNomx1C6nXYnlkuocyifmoNN87rjcCq5ln0vTTf2Ph6/uLG4pxs9aKyg4YHFQhz
         LqLFLnXSIzydN6E3Z/eJ6V6Ve3cmVDR1ACORTAvU2nMTeAQOFMBtIZ9DYVNEI4Y+R2Of
         5gOFRtinmsV4OR9Hp6ii51SqfmxQ3vA7QbBONjkraZ8Ma9WbSIXuVGhJ09Yju+D5PpQJ
         3griTUnLG2bXyXEt7UvVF9rq5/drjqVZsax7ZsiFIj2KWxxJ7aj9Uuap0Pt3bFLWKgsP
         q8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783595786; x=1784200586;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lQNxQw6rO9fLZuzYn+ybwybDNA8F5Y/5chm6JwlKasE=;
        b=prg998RR/KDdC1/JqlPgJyrGRnKh1/U9NJ8K3YnVv6U9D67UoBaX+7TYJLTt7TDDHc
         rzJ3Abx3ST1+kzoXse54QGLC/BJaEdO9nTtQZFupD6D/E9SCs9cnfxfuxs8SO7E/qEk2
         xEiJPU4zz/T0Zr8MVA05WzT4os5p6HtkE7m8aVI9i6DWjfZC52Q2Fs4HdoVgQpgyf1Ot
         sK6+E5pt4hZOnI/FFapsmf0NdrX6rw21VgV9uLx23P1azgDMXLLGPgPmxRZKWfWIVL6H
         wlqOU04Fecip1V13oc8mjHCc+WRe/cdVgXY7LqhjR4DvAVlRx7ziE6fQFijVVAnpkxDN
         ZdSw==
X-Forwarded-Encrypted: i=1; AHgh+Rp0/K3Mckk9P5SrJzM++hHPbT2WucRiYHh6sj9ynetZ4C/G7HMIdmNUAV9tMmC5vLmCgtw6Xwm8/Tlz@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzJ1SZxx2OtordhJGtAlz7Aj9hfed9Vi/GQrayVMskFpGFaNhBI
	MplA2gHDOoOcKH+l/HT0W2+uLvDGWjfRXghEbA0uE/t9mZ8blXHBFZN0qiB8fvdKRzQIS9kU3Tl
	nz191J6fwahtVUC5CyH3J952PrOiEiAPXXzdKvlRUTvcvDjvDxcrGqeAnCJ/lQSxhO3Sev/o=
X-Gm-Gg: AfdE7ckIE/WyJlObvBZHHRvS+FiTzGs1ZzLepppRjunYuRziuUhVFWSv/IgoWYirffT
	np4cRaeFmX/hrXFrSJi13Q5Dtb7yt1xe+FWcSwG06QVqa/3PfoWjmlKzaxhPSJ9CEAVeKuwTl61
	K50ZpU1S4RZv26PwjqYx+w4jRJtvoIcXJiazoU3GxjuG1nJUZ4wWgy7vz1kd8AKEyRmXxctI7zb
	izJPySv+ZHeDPnyFmmDiAc9vbceHr8Qp1w++RguYAO4pilltcc/Sfifuz6OAVEuaQGPxm+jio/G
	k4+X97avWOSM9hPnNEMdzC9bkbEk+Slx5MwG0IDbSsgT3ZrPJFuB8c0RKPrqqKExpW1OJ0VDG/T
	huZx84Ku2Hgk6ZeJcEfWjtcmAOWIP9D9koZ9dXL0f572uXfv8jx/5vT482lbXsQ==
X-Received: by 2002:ac8:5a94:0:b0:51c:22c5:daf4 with SMTP id d75a77b69052e-51c8b3033demr72818271cf.28.1783595785867;
        Thu, 09 Jul 2026 04:16:25 -0700 (PDT)
X-Received: by 2002:ac8:5a94:0:b0:51c:22c5:daf4 with SMTP id d75a77b69052e-51c8b3033demr72817641cf.28.1783595785396;
        Thu, 09 Jul 2026 04:16:25 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8cdsm54261424f8f.1.2026.07.09.04.16.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:16:24 -0700 (PDT)
Message-ID: <b45abac8-0e8a-4005-a050-a0d37e1c8e2a@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:16:21 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 05/18] powerpc/syscall: Use
 syscall_enter_from_user_mode_randomize_stack()
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
 <20260707190253.918861529@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707190253.918861529@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX7xp9JTI24t1G
 oynoIjZNqB4TBrSynforY734lk30/qDpu5YUpCEjE+02ALCrR8oJKEmZwYz1faghSNuYB5gIki8
 dT1ORYUq5GK1pPSs48KGEHvgNhprB/z5abzGmZnv1y87b8nN5D5faZkfKTgR+1xM6vHFHSQIrZ6
 SLYkq5KtmxmSsluoi0teNg4yyXyyjsMUvrSl5srA+UiQk0AwSifb2w+nHtH90NEMcj81uJPANDM
 c5fuErDHwbIude1DfCrEosB/ojlR1LG3DhhNDNjep0vA1STazZUqx0AVtIORDGsKB1x3rb9iV8y
 JPl2iG8foq/m0niPw9JHTy4DzM9FrawxBNx8qt4cQ84TYemz/YnpZ4lV27K4b2B9EfTHeibk2s3
 koXFF7L+XXsM+if+YWAO2F0fLxBnQNx6gNA39JigHOdfpj0HjPdqG2KKWxvsISlZSG+zSnhw7FD
 2HBbuZjhy1EYtfvTjiQ==
X-Proofpoint-GUID: f9tsI8MtMYZgHljgjD8_KlsWU1MwHBEM
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4f830a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=voM4FWlXAAAA:8 a=EUspDBNiAAAA:8
 a=DoJJhcVa48uSEvU2-xUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: f9tsI8MtMYZgHljgjD8_KlsWU1MwHBEM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfXylWpUsw/PeW3
 wOTFeZJP+v/jQUylwMXWvoy4PxQIyHEpK43p/sGlOdoH6bieU4fF3JuR62vTRdMkLtVb6YcY1Jm
 mjiBR8UtfJmJQPc4MiINNLPFL/TnbhQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
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
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>   arch/powerpc/kernel/syscall.c |    4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

