Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1561533B6DB
	for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Jul 2026 11:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596155; cv=none; b=RLNvXPal7TlSfdfujIHW1B0HYI7R9B/XjwqelnVKcNtGOuJQUC2oIRcYs59D0AQr37ckvuXNWKRZk3AzsWIOb9s/BjO/BP+cahVlRgZ/oMiuCktcuP3y+djFa8vqfnuJfMifCtvUe9GURNHsLEHV0jgf8tKMhvgdWdzX0A2nbNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596155; c=relaxed/simple;
	bh=GMTUKuNW7nHEjTmJYQtVLsm+lxP07KtZQHvvJ99eHNs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=EgsUKpeA31dkIhrW/vfwwsSPgGLytUO5+jU8Z0B9XiKuuHJD3RdryipdjPIEAwh/1cI4QPjCZsAdm2GsxMzl7JpccCkjfYB8nS4ZdHN0rol54A6VXpilgDu/yGykjKq1F7nnbadzgUL5eytGOMnlaRcv8SIJued86sML2axHnOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jTI7fkXQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UDLn6Bv7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jTI7fkXQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UDLn6Bv7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Ax95q1483629
	for <linux-m68k@lists.linux-m68k.org>; Thu, 9 Jul 2026 11:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GMTUKuNW7nHEjTmJYQtVLsm+lxP07KtZQHvvJ99eHNs=; b=jTI7fkXQl7cmfY8u
	/6bNS+Fwu0N0JYJjqKlpNE/bUkl2mhzeMCIy9YTKs/eoShIUpl8OQCJgxUcCe1Qs
	3cJw4qK9vv+hDmJX2IozRyra6X37WE8v8Vxl6bxaUL0j5/MLQKzhvIKs34reKXrh
	QWs1Vb41u8wIG/o9knrL4GgKq2/ZBNYGTwPnHTuT5u7jJ3EMLnaiRdEBXGlLErlS
	QMBDjPbvcSMQgesyK7qkf9Xbt4GVvlCDF7pU0Ep4e6tiqGpO14UiKVK+WJIifgMb
	eFDVUlYtLgbk+5e07s9PeDWnBLvsQTPHVnHxEKk6PFxWS/VH6saUNZqOsHQv410+
	3wCVHw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1ydtbe8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jul 2026 11:22:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bff5c7035so14787531cf.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jul 2026 04:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783596150; x=1784200950; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GMTUKuNW7nHEjTmJYQtVLsm+lxP07KtZQHvvJ99eHNs=;
        b=UDLn6Bv7gQ+sx9TNyHqq1nNFNnHqkaPE185uZDw7RtiJfM75RxrGVWMX55PpwB6ElE
         qeLkTHLwAi1Op8anIQaVOu4r/a4IcjNDRS4dyyPsansWVr21WtJGTg7X9ylfwkhVSAIV
         R40R4JYyZWpVPTRvA7lWRnxYdEbHfhjHFv+QE9MI4k/Oww4tKkarffpHf+V2BQhow9nZ
         5uNSc+23D5V0/P1JHMLZewxWcxZtOQS5Tre6KnncB+APPWf7QF/G1uHw/gqtYKtV9L4p
         QGCpk05ynty50uux0Xnd72G5SOBFV4+rD119Kt/TlD5Otjj4feD8xyRXzND3Pqxgw/5O
         Iv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783596150; x=1784200950;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMTUKuNW7nHEjTmJYQtVLsm+lxP07KtZQHvvJ99eHNs=;
        b=Yk28Xmaj4OFmdTIiXVA22rvQidTEtkGvwLfhiZs+zC/YvyX2Bp2Gom0o/h1rvfQ4rv
         KYdWbexnYRN9vlm2mIVFf9F+R8KEOIfSHHZorRLXbmaX6cSUYvnvy+S+iczfhcmJtWm9
         8n6QMjAngDQ+efdb6Wo1+J0g45zLacNp0EuCFRs1YRuWiepN5XSEPHzLKvJxiAWbfSGU
         kMhxTnsEXrCdiy2tAzcsSKe0iFZMaKc6bEJP7lIJ4wl3xmkmcYklbCsUW/dN8YWImOyX
         V+o+jPPE3KPu0pk+TioDLPbIQ8V2svLr0oHJDMXM1m3Pwn8Tc12ZKeabZe8dXL7VislP
         c71w==
X-Forwarded-Encrypted: i=1; AHgh+Ro/59YKDPK7R8xDrGoG7UedM1QYvt2pplQcgzc8pLcIkuozaNqPZCP5KkhJJXWGMkA1ovtvs1JD+PsT@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yx//WHmUraa8ERZ5KtLECJFuglwUGjfEkMu4lY8SlMHnNbLXRQZ
	mfso1ztQHuag//fW6stcSizjvYUR0C8jLXkOH/T7C2YO/I9uc8bMXV3cuduEM/A0gK6nY5/OYGN
	JKljFd7IM240/sY2t4WD3/HI44GtuZSByXxlhd0rpaiPN29gWBNhlhHR9v56wT0SaaSQTm9I=
X-Gm-Gg: AfdE7clOccVdaCnHlfYQwvKi4ksDjl26pVcKj2i7cR1R64uQz2iKDuDBSeXZC7j2sEo
	bECckeih9LrYxliETwSuVi7+s5OE44f69FzbZ/AkTUuNQksKuOt0Q2rYpZt/TVB9YcyubQ1fN41
	3jvmAukzjZNN12jQyZRc+sHkgGu0XnnJiKlQ1hBWgQPKtyvjfl6QvCd8nKuqxReHr34705QBpa4
	9iCW+qn32yw5hMuZF5i6bOlgbI2V2fxnBQg0s3Q/I8mAc4sA2ddExk0GBnUGYagRgau5L2glxHi
	s4e67Sj5Lmh3VLnEQ12HAV39JBvc5cdBI3jXtlgJ6KV2dMd2yVGnWWRRpjZH0eVCRqR6ix4UmFT
	KEu9dy6isM17bbfuOjgHncrjtURiH+62YO7xFkMKHi14WuxjtRmXTzJoKR5Ikmw==
X-Received: by 2002:ac8:58d4:0:b0:51a:8c86:bd4a with SMTP id d75a77b69052e-51c8b407e1cmr74988081cf.71.1783596150612;
        Thu, 09 Jul 2026 04:22:30 -0700 (PDT)
X-Received: by 2002:ac8:58d4:0:b0:51a:8c86:bd4a with SMTP id d75a77b69052e-51c8b407e1cmr74987351cf.71.1783596150195;
        Thu, 09 Jul 2026 04:22:30 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e6ccsm50814277f8f.5.2026.07.09.04.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:22:29 -0700 (PDT)
Message-ID: <ea24e611-91e0-4397-a49c-1493966094f9@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:22:26 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 10/18] entry: Use syscall number instead of rereading it
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
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
 <73b82749-2df3-4c12-bc2a-ff7628dc8292@oss.qualcomm.com>
In-Reply-To: <73b82749-2df3-4c12-bc2a-ff7628dc8292@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfXwxbu8AX2hMdi
 oV2tkB/4WxV7OBRy0g6zmJ/wZz1cg+o/+hlhGVw7hSl/ikzxhqybQh2PQEkZAGPM20+sryqQtUK
 cFhApDalGD3P69TkrhuzXmfJkGZb9Gc=
X-Proofpoint-ORIG-GUID: tZVfofP448CVYDr7F5rWzniN3_vXyihO
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4f8477 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: tZVfofP448CVYDr7F5rWzniN3_vXyihO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX6VaWe0v+Ly4R
 TkTSRS1K5Bp2GDnP7XR2sVLvK84UgYR19eaSsXkx3QkDXc0O/Fmoi3kaJAbwFIoO8+ofjpmPcT+
 sjOYO5pIlzbDVosmFozLti3kFO0a8rUo5DnqHnySSAjs0bTj4nFKtZ1COnbsHyMDrwSme1ffwhT
 GAlFO1PUGBtpiqm2Of1WMVBlU8OdhYHrEfNh+HNKgyR1TIqBTOMlmHf8jkvKCmPQzN6Ufj3zsFd
 NAivc5Uj7Z3m5yQhrlSWU6PhWx3210YuIAf8yIhGO9C+N8z4y/6O32UpPW3Fg6DfM3jHUp1ndQ/
 w//1PwJf4w55Q19o6x0ZDBQINIMHdlRItl6mfiun5Subs7d6EYI+jeU4kUlr9w9QQPKlFFCNwnl
 gt+k89uIY1zqcgI4vLWRRymvJN/890FuO0b0Os0JHKrDu4g47hW5dzj4lTWSEtr5cTv1I5rXvPx
 aJ33dVyCeKPA9gkfADg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090108

On 9/7/26 13:20, Philippe Mathieu-DaudÃ© wrote:
> On 7/7/26 21:06, Thomas Gleixner wrote:
>> rseq_syscall_enter_work() is invoked before the syscall number can be
>> modified. So there is no point in rereading it from pt_regs.
>>
>> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
>> ---
>>   include/linux/entry-common.h |    9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

