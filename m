Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FEF53AC
	for <linux-m68k@lists.linux-m68k.org>; Tue,  4 Mar 2025 06:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741068698; cv=none; b=hO/vlgtSkMCXSBrgt7x0/TFbPIDqYJV9FRhPCxYJG9aRTpQhNLOZq+0gRNV0aJFeMuxlUEje3Jyta8e/WJMD+lRkoz3RnJaIZ6o0usrSaTqxIDMfAsNnKKH+KfPOe5Ziq3cyEu5lF9KIB8Rz/31MgOnbOLRLFxuqz/tZLUwjkWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741068698; c=relaxed/simple;
	bh=xVZb2uxImUx0ECcSqYKHOxrGyYGp1I4gtxr8DYt1oOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kEeKuCPrpUvu+n7YIhiYfHRuL0ioNLKR7dM4ZPIb4lZmbox/MfNFAVs9T5f/9STJCkCSQVsKxZoRarBvAmALZI6fLt9N9d7nMDh8kh5IHSXNBo/hRcEGBEDYPWn8mWzPIP/q6eeXapNMoXSdk4GQfRe9lV1BszVGOn/YIsE+SWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=hY/YbgmJ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="hY/YbgmJ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-223a7065ff8so50286775ad.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 03 Mar 2025 22:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1741068696; x=1741673496; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FvNFViwfp2APOt2jux8SKthZ9o17Z2NZrToAsK4eao=;
        b=hY/YbgmJq0MusMuzzuEEKSBprBUk30pPERzpM9LfYB6EezPeisHa0xP7Ygws8RSB7Y
         CcRmWTPIfZCONPc0L4iH5Hqo5Q1Luusuyd8HIvbyzd4zN2t8Qh58WRY18kg34ZXZhqVS
         199MywbBETeYuMb8vBp/txfNbV+l3wZqpI7bwBkJK34zqAP2+N8MB6inLANoEv/eMaMM
         a2uED0DjOouUfyHIHVaD08J4JTIlor09CMb4vNJNOBQ+iWiNsWKiLz4kgTrzUf4hqUPD
         Ab1gYExUc4ulxpLPyTgs81/NigpIkevRkRvPIrOpW1yLitGQfKuJFebjSgqm9s7NszUy
         hwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741068696; x=1741673496;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4FvNFViwfp2APOt2jux8SKthZ9o17Z2NZrToAsK4eao=;
        b=Yb3E+l1IKp0sXxx70/UtCLyvvmDVhPZtS2d5pVtgInIIMmmiiWRUNrGKT8gxee5WUb
         VRBZmKuf/Q7TmTqq8wScBikd93YODMN0i2WEE29eYyMMHLomnUeGTeCNy2QAvud7L2Dw
         c7pXvL/g1ikgRZbreqnN1ERj1lanYMmjvI7vR48hpVLiiNpXtTmUA6RaWXRYKmEeOg2V
         VxLx+H9BUOohd8HZpGjCMbV2Q5xfM/2H75hPeRSW0J2Azw9wJdofAl00Vx4YfqbcQ/+F
         ByaF66yO50m1zQjukyMzIShij1pioPcDYC+rHcprKomIOMYDi57u2x6Up+xJydzxIx8P
         350A==
X-Forwarded-Encrypted: i=1; AJvYcCXZ83HLFPNuHggCrUNcx26vOckVTJmP8/J1abRVZIf1rueYoH3EmFelsLR8rtbAQGSZ7wEhm+0wTZE9@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw/nGUsaSnmis0ddo0r5F244YXxwiHWW8ppEpsNggffbKgPr84v
	cnH72wLFezzSl4CU7/4IkaCdbLDz2eyOYCLLvEzL2y5hdkjsogJ8H2qgMRv5n20=
X-Gm-Gg: ASbGncvhESMLeFpf90GPwtmO4Lj2lm6LhkODWOdTEgKyuQgJza/1O1DflmwmSY4Y0kM
	NeeOvgB7/aOzJGQFcM7FrZjW/Jdig/bVjJE7RdIyGO9tC5FBfgx1+G8FcGuclp813G0HKcYuDfX
	QEmms0RPEJjK8hX9cGP7J/tdF2p9oghpzGpaXiJLN1rGk8b/xhITdKQwDfbpzSPaWI/dxJtLWyW
	Ceni4q1sWg1J2lXtAitK0taKMMeADusMmKBXMPYlChBv9uzDeOVw+aDIT7Z6gZb3prpbFuItjcb
	l3c0LPX2ixJUqJMfw/CQDI7x7C6z12ya6Gleb8/5N7snCv+8dQWL5jgsRARJyA8dORMw
X-Google-Smtp-Source: AGHT+IEXDQyCMQ8sBrL+0HeKoJpZdetEfwPwd6LYj+c4cbVY5/CTPcBDN/0v1nn1xNdV90cajxorag==
X-Received: by 2002:a05:6a20:db0a:b0:1f3:40d3:67d4 with SMTP id adf61e73a8af0-1f340d369d8mr504424637.30.1741068695820;
        Mon, 03 Mar 2025 22:11:35 -0800 (PST)
Received: from [10.68.122.90] ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7ddf23b6sm9305805a12.15.2025.03.03.22.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 22:11:35 -0800 (PST)
Message-ID: <7d1c834d-bc65-4979-9b72-0d1d91019501@bytedance.com>
Date: Tue, 4 Mar 2025 14:11:24 +0800
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6 update] mm: pgtable: convert some architectures to
 use tlb_remove_ptdesc()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, riel@surriel.com,
 vishal.moola@gmail.com, david@redhat.com, jannh@google.com,
 hughd@google.com, willy@infradead.org, yuzhao@google.com,
 muchun.song@linux.dev, will@kernel.org, aneesh.kumar@kernel.org,
 npiggin@gmail.com, arnd@arndb.de, dave.hansen@linux.intel.com,
 rppt@kernel.org, alexghiti@rivosinc.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>
References: <19db3e8673b67bad2f1df1ab37f1c89d99eacfea.1740454179.git.zhengqi.arch@bytedance.com>
 <20250303072603.45423-1-zhengqi.arch@bytedance.com>
 <20250303155331.de9b2fff9b04984a255a7bc2@linux-foundation.org>
 <c48715aa-8c1f-41bf-92a0-bacf401c2f7c@bytedance.com>
 <20250303200815.53007fb79e5049a99f24c999@linux-foundation.org>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250303200815.53007fb79e5049a99f24c999@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/4/25 12:08 PM, Andrew Morton wrote:
> On Tue, 4 Mar 2025 10:31:07 +0800 Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
>>
>>
>> On 3/4/25 7:53 AM, Andrew Morton wrote:
>>> On Mon,  3 Mar 2025 15:26:03 +0800 Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>>
>>>> Now, the nine architectures of csky, hexagon, loongarch, m68k, mips,
>>>> nios2, openrisc, sh and um do not select CONFIG_MMU_GATHER_RCU_TABLE_FREE,
>>>> and just call pagetable_dtor() + tlb_remove_page_ptdesc() (the wrapper of
>>>> tlb_remove_page()). This is the same as the implementation of
>>>> tlb_remove_{ptdesc|table}() under !CONFIG_MMU_GATHER_TABLE_FREE, so
>>>> convert these architectures to use tlb_remove_ptdesc().
>>>>
>>>
>>> checkpatch warns.
>>>
>>> Do these things have to be macros?  Switching to static inline fixes
>>> the unused-arg warning in a nice fashion.
>>
>> This can be switched to static inline. In addition, I found that alpha,
>> arc, microblaze, parisc, sparc32 and xtensa also have the unused-arg
>> issue. Do I need to add a new patch to fix all of them, or just fix the
>> newly added 11 warnings?
> 
> I guess leave things as they are now.  Switching all these to C
> functions can be addressed at a later time?

Okay, let's leave it for later.



