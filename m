Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CAD166F29
	for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Dec 2024 05:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735534907; cv=none; b=YIDgCx2p93tlelf/Yzq8ARReTmSi/hQYuZhQupOq7vz965HSiKjp52ygXiHM3QqU/h7AD6SlAW+TcgWUoxmMA/sA1NY0OPESKaiFjDbSKxXCRKOTs5AU0jMcFUjx4RWy+/y6jqvBiStrIGXM5RrNmtQUCoguWR004LpY4tTkqMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735534907; c=relaxed/simple;
	bh=piyHCVVAMwS1wQEyd4KrwKqNTu7KlhnDsmo79+H7v/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n7BGSoZP+V6LSGE9dDikaujfpT/faaUPBfKry1zbiM5qjsdpnBGAflbXZmlahMakagRz5uft2DuDC0yPgA8xvr6UoIG9ArSTUBw8o4ZoddkYyrQ48Rapo7tYIe1/b4RRmaidWQ6idvPO6Ggq7u/k/cFO6TStgXJAlWMharsLq30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Z8Aaqml6; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Z8Aaqml6"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21644aca3a0so14771095ad.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 29 Dec 2024 21:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735534904; x=1736139704; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z71RF7AQSzzvF96cC/aV2tD8Znb4DG916rBbscUdZ1I=;
        b=Z8Aaqml6pdgxz5zjE7KgYPifsWZlhta4fwd2JVY06qLvhimRjSCkCFgTrxUN6R6aGj
         vsPCsflQ8X0RtPwEpt134vX2yHyyM+1taFWu/xbi0MYirYfdJ8fLjmTQzmUhP42dxTVB
         lAgGkvAU5g2x2Wx2JFRUHqMXOMClzo14AjNY7iLX9hPaDgKpKqzGwQiYLlD1nmYhn+WF
         r89FP2x8yPSJxrWJpwzaDIDXc+aukqVjTlg9T5a5KrQMZ8+4V3YQ8pmbjzrKx2CJm5f/
         lAfAnJrP0G891kVkhChGUTv4+D7HJY7ouJ6ZywnFa9KiDnNYUwrFULJ3h8ZykcZn/aJ7
         yrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735534904; x=1736139704;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z71RF7AQSzzvF96cC/aV2tD8Znb4DG916rBbscUdZ1I=;
        b=U4zkPOqHb6n3Zj5wm3SE2BI6AgiYwGjpvs1euseBsyoe+R+TjGIW8v8Qs1BqnC23pq
         F5ddgumdAS/MNCfdFzL6AmVyuae6zylK5IzMMLaIBYkxMkAxi8TXiK/v17YpyyvZz4Y1
         rSxCJ6POpxOiO05n4BNFGuUXg4ndwSMq2pdzerNmy8oAi1IraV3IoqimDg+rzF3BtbZq
         jdZ5a0RUwke+i1VDpeSZ5uuIkzSfuIWVMPm4WN42iyYNHPrLeGIE/6iqMjfj0UvaE4PO
         0xxP4/7YMzjVbbK/PNAasX7iJju+zNZwPciqDt+I63mPk0brmw3I1a1yMX7BNY3KVYU+
         twMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoNNZP0lxjEJVuO/NmRzvjwFtOS4gWWwewm5az3cQDkxkCR8L4JHcur3mb7RqfEvHD+XCFPRK5PnWn@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwI/P5wUFUiB6XB+51zHRLVyGdZrj6DfGsLR09Dg+kStKaDmFdr
	Af7BmCSOaXTT9bP1cwEZ0Q02SBW6mg/YSwJIXaWw4VrhmUqitvholblYF3T7v3U=
X-Gm-Gg: ASbGnctkqReBJszXveSGNNT52Xc7KF5NhCh5Agc2f8YM8cx5jF73jMtVWjPgiSvkBQA
	hgEahFbUk/ncX4X7nhvihkSg0EP1PYTQYDb9xly8Nyk0tkXDHy58iuzXCHWHWIPC5xAdj2OtH28
	oEblltr0ThJO7G2eCkNJryavBI0XF4FUyre8aB5c17fewUXcYEvWTMuUjV2aSdx7WQITUCrqoxU
	cGW36Ran++u7XqIb+1ZfACVv7yzwfENTPXroZg3hTQv1oDqMkaGyk1AvmhN0+cYXSmxPpVAUsYX
	BNn3kg==
X-Google-Smtp-Source: AGHT+IGNJA4bVLowcqsTNcTKWXSt9C1oo/1EXH42Qr0z5K3kcPv3AzGfuER3K4niOaxH4y3G0nd6hA==
X-Received: by 2002:a17:902:ce86:b0:215:a57e:88e7 with SMTP id d9443c01a7336-219e6e89215mr362710865ad.3.1735534904325;
        Sun, 29 Dec 2024 21:01:44 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba7325csm16914771a12.7.2024.12.29.21.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Dec 2024 21:01:43 -0800 (PST)
Message-ID: <efd81018-f637-4925-9104-c9586fef688c@bytedance.com>
Date: Mon, 30 Dec 2024 13:01:29 +0800
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/17] mm: pgtable: remove tlb_remove_page_ptdesc()
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>, kevin.brodsky@arm.com,
 peterz@infradead.org, agordeev@linux.ibm.com, tglx@linutronix.de,
 david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 lorenzo.stoakes@oracle.com, rientjes@google.com, vishal.moola@gmail.com,
 arnd@arndb.de, will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
 dave.hansen@linux.intel.com, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
 <b37435768345e0fcf7ea358f69b4a71767f0f530.1734945104.git.zhengqi.arch@bytedance.com>
 <Z2_EPmOTUHhcBegW@kernel.org>
 <9cac5690-c570-4d43-a6bc-2b59b85497ae@bytedance.com>
 <20241229205545.e4fa797886f30cb20c38ad06@linux-foundation.org>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20241229205545.e4fa797886f30cb20c38ad06@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 2024/12/30 12:55, Andrew Morton wrote:
> On Mon, 30 Dec 2024 11:12:00 +0800 Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
>>> For now struct ptdesc overlaps struct page, but the goal is to have them
>>> separate and always operate on struct ptdesc when working with page tables.
>>
>> OK, so tlb_remove_page_ptdesc() and tlb_remove_ptdesc() are somewhat
>> intermediate products of the project.
>>
>> Hi Andrew, can you help remove [PATCH v3 15/17], [PATCH v3 16/17] and
>> [PATCH v3 17/17] from the mm-unstable branch?
>>
>> For [PATCH v3 17/17], I can send it separately later, or Kevin Brodsky
>> can help do this in his patch series. ;)
> 
> I think it would be best if you were to send a v4 series.  Please
> ensure that the changelogs are appropriately updated to reflect these
> (and any other) changes.

Got it. Will send a v4 ASAP (remove [PATCH v3 15/17] and
[PATCH v3 16/17], keep [PATCH v3 17/17]).

Thanks!

> 
