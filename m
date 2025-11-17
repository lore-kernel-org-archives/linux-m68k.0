Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF3D25A2C6
	for <linux-m68k@lists.linux-m68k.org>; Mon, 17 Nov 2025 23:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763421260; cv=none; b=hUixww5j7+SU50JtMS2MfdJxCJhLevrA8RtpKXL1u9/00lxmQZjuWjtpwbMBEVZwgMc6oi9Z+h9rZGLtI6/nG4izy/rjdwMs/xbfGA75MWBX6FPBySblMaMzLLRAJ0eU6rDJKXoSpriGCDCy+hyje+7RT/dkMpC1aXYjszWQ7fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763421260; c=relaxed/simple;
	bh=jLB6moYbYMb4oAt4L/H5f9WgTTkiluQ2AcY7gkr6Zto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C3qiHyKr6OlTQCYL44RZn0jNCmjNrDt3IsFKxc9yvgomn7P92KwGEmLlBx6k90aPeGdaqSBdzJyJVEhRSlf+AmCb3rGoBBHGVKo/3RmfFlBOsMI8kSJIhEE4gpQvxpGf783hbxINUHWYB8xiO/8EqgcaL1Zb1Wq71ikVyBw2Ezw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2jdVASS; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2jdVASS"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7bc0cd6a13aso2887972b3a.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 17 Nov 2025 15:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763421258; x=1764026058; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gw3njvl4GlvyJ/wTccdCvKwGIk1Y/4IXwJ5Yzybhm6A=;
        b=Q2jdVASSKNMY4WftgBO7r2owNtdN5NrkaF50A2XgDYKMrcKW0TTWMS1iEDxqNj+kak
         3oRPfYNzztvoYHiRETSPWpn3okSy42JNAyGHKzn36qilc63qABajedLzbnIbHKOuz583
         tT9PS8S4KF+28Sb97klt4XcWLbAaDUgw7Qz6v2gcDapUB0T/yW7c0+lEt9XPFSRMUTfD
         fqZ9Pvpas24wxMN07XFDTgaioqn9h6ho5Y6949vuI2o5CC5BkaoUo3Id6lXq2vqjBzQ+
         fbYl43gpFqNnQH2kOsxBiMddhd6ukzmiftFIJcpznvPLnHiFzRlQcUA3PLjda+5vblVm
         Reaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763421258; x=1764026058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gw3njvl4GlvyJ/wTccdCvKwGIk1Y/4IXwJ5Yzybhm6A=;
        b=BSKF/wGQimzBhGVzgwBR6KvRldXWdV7Uwu3nSRL9M9783j/EzbWC6NS1Kp3BkiX9uw
         5s+w+6kykS8lhz65LSnDYCTNedWs0bGm0Yl+4tVB+DBo+etHESNTv/whK5BQAW2T+QdA
         B7C8SKpjddUubxJEmntGbVNpaRZthP2UNYzwYT+CcZzaR68sfWiAIIa6+u6e/F6WuDPk
         udEijTzdxB6wZ0qJpqAiT2K1TFqe4E2lM1jX7QIvasthCM4DYu4DpFNJagDTsHRmGnIs
         aQXUyXFBL9touyV7CRKyMSrPrUd+S9Ehc+CEXoZlfS70OMx49TdbEC7DqLQoVvSASwQG
         CRlA==
X-Forwarded-Encrypted: i=1; AJvYcCVo6AgDipI0OPXqLM11ty8G5Uf4vnWnB0X2qeztPVtRiKsn7aCJg0Jh0tT02d5V8ZLxMeCdAcbvjWH1@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YydA3GiBParHUaWcGHArNuAuwoqDfoBZ2Iv53uFw4+WqI/+0sCS
	qpOQJoUw+NxsxGE+O+z2y2BmlEp/bTdh/hkxUbEnXigMI7etw/m2Dx1B
X-Gm-Gg: ASbGncusjpeUVEAB1ose+UHRBHCdkCBIXgFuDj1TdECRTrmmnkZvHZa04mwUmgwzqBI
	hLyazJdICvEUDlOF26bZJqPFuexV865OYszwAv0uCovAP96C0UHwfUPyB0h32XWuLGamVUk/11A
	uwgf8pB+h1kAXv30ggjN/5wewKwID5BIy2NmpfsH/0g5DlcMARjya9WbTgyFIKtgvWLdqb1xKF2
	IEbR4on0Ep8NFlMO2XICyVVt7PYoohvnjrcjuLohFr9i9P1aRUD/a5upE+5ZkQDjPgVoafpG1rk
	HSp6Za289/Sl5VOh7CXrcLvC7nEel7rtw19SVTAO65Scc3DVdEVZ3+KgsCuXfXcHVPGHlsCS4ZJ
	HPI2YO65IccHuvCLoCTcl1a4wgmnoaIwYgKW1VavjEi7i/sdTy1ssD65ltXelNFKFflSyvQ+Vfy
	Tl23aEEEtCgVS+DUpYWlj3h1zJKu7x+lmr+2eR/bSFevZyesBK7WSDdv6mkYfRRvYEFJYbuF383
	+nnPGo0dGLLlYvXE1BgQuE=
X-Google-Smtp-Source: AGHT+IF1tvlGKX9DV9wAYY9ohHIZYvMdnoK1lO9GjrIKyerueMKm+3JylDBqlzjP5QGSHI71zrZ2rg==
X-Received: by 2002:a17:90b:48ca:b0:340:9d78:59 with SMTP id 98e67ed59e1d1-345aebaa733mr961168a91.3.1763421258083;
        Mon, 17 Nov 2025 15:14:18 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:3c0b:485c:47:857e? ([2001:df0:0:200c:3c0b:485c:47:857e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345651183b2sm10773227a91.2.2025.11.17.15.14.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 15:14:17 -0800 (PST)
Message-ID: <292be779-a36b-49b5-a9b0-9a5aa222fd0c@gmail.com>
Date: Tue, 18 Nov 2025 12:14:12 +1300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: Implement kernel memory protection
To: Daniel Palmer <daniel@thingy.jp>
Cc: Greg Ungerer <gerg@kernel.org>, geert@linux-m68k.org,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
References: <20251116220508.1513445-1-daniel@thingy.jp>
 <e5ff379e-b679-4513-b390-fa9b604999f4@kernel.org>
 <CAFr9PXkzhEEsSUXWCtpHaX6DWEKzX=xCESSpzbSFoJgf8mrz4A@mail.gmail.com>
 <126822f3-6f11-d02d-43f8-1b5e6bcc910a@gmail.com>
 <CAFr9PXkF4CUYUNaYQGuadAm5fCn65hMJDdGo=zwcPDaq4zOxSQ@mail.gmail.com>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAFr9PXkF4CUYUNaYQGuadAm5fCn65hMJDdGo=zwcPDaq4zOxSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Daniel,

it might be possible to fix up the last (partially used) descriptor from 
C code, if there's a limit field. I find the head.S assembly too much of 
a headache to change, but that would certainly be safer.

Wasting up to 256 kB is a pain on 030. Maybe rather skip protecting the 
last section?

(* ducks ... *)

Cheers,

     Michael

On 18/11/25 11:01, Daniel Palmer wrote:
> Hi Michael,
>
> On Tue, 18 Nov 2025 at 02:41, Michael Schmitz <schmitzmic@gmail.com> wrote:
>> Daniel,
>>
>> take a look at arch/m68k/kernel/head.S - 030 MMU setup uses early
>> termination descriptors for kernel memory, _not_ regular page tables.
> Yeah, so when setting write protect on the last bit of either the text
> or the rodata the end is getting rounded up to the next 256KB and
> write protecting too much.
> I worked that out and adding some alignment in the linker script so
> that everything after the places getting write protected is pushed off
> to the next 256KB does fix it but wastes some memory.
> Looking at the manual for the 68030 it seems like early termination
> descriptors can have a limit so I could set the alignment, fix up the
> limit and then give the wasted memory back. But we are using the short
> format that doesn't have the limit field.
>
> Cheers,
>
> Daniel
