Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A53B46AEF4
	for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Jul 2026 12:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784032466; cv=none; b=ZqTn/IPupVgBCElj0mNPrFEycEVyC0s6giVU1QCc71Iz48DSUK3NwRgIbEYGGeGk+jSXk4y4+1YxBQHyFzUccqJs3JNBKAavypqkBx8n41D7cYexB0gc36pL1YY99YmcN7IiTx0WBjX2rZeRiKvZ/uxgKQDJCEEWKKHmP+EEG8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784032466; c=relaxed/simple;
	bh=WegHpjcb2vagWqLjN3VnSMlDf7mDmA8mmd3Rp43fqxk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=doqcPrJ+1y/vrUdtz5L+kWYOPNrmZgCOr4aiqwDE+FhKKDFOMp3X6kr8LAG6FTd3Q5JT7xodDNw9H4lNETnonBuLiOQAsixs6qW0XQwO879TB3I1WpvC08KL2QNknyK4FO8rOtuN9cWnqKntqRLz9w5XZwxY6WC6Xg93yw94h6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HryQzCa5; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HryQzCa5"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47d6c634f45so2338102f8f.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Jul 2026 05:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784032459; x=1784637259; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CcC3mXhC9vFPxE1TVGprdVmvuMWQZA/m1vfAGdGaT0s=;
        b=HryQzCa5yJedxg6v0Yifqwdf3KWQsOpoxOax9JyQiVxUHJOGrS2A77svzKCrc/7DxM
         sTyFtfclKUjlTQDrZTlhLH7Tq0AxMF1pBSgyc3vfO2YpGrgpr8Fd7BZcue+OfD5yiS9A
         hgTFfkg84/plrzp8qSwwyf2X9i6hULDL+kNGHIf8/nWKgN64ZRMAPtp7LxXvr0Jp25L2
         1VMHbJcSLowdVuan6emkPt96tNcmwDSyvbeYGs5uY7IOF/SfDXf1MEU24VRcY4K+UWyr
         rQZvbu7hJLEdAvWQF5fnJhGE+gwRfwQkmv5tX4S1q2eme2G/C+2OiShqP0kPQqAuynDD
         MjRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784032459; x=1784637259;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CcC3mXhC9vFPxE1TVGprdVmvuMWQZA/m1vfAGdGaT0s=;
        b=NayXiIuD1QPQHkHkOx+Qv0/dzW/CAOZXUyV83AUTdt4k1PDZ46fyDTMtW5bvKlInx2
         sISba1JjFwo9nJsGTlrHG41AjWl31+V+d+iXfTIwhWzaAyE2xpJuxWwjw42T8bxO/eco
         m6ayEcVmJtbDvTBrbCzSYz9W124kuGOJD2uqX7qHwW2/A35pO0/e5IemwJ5SqHtx3RAg
         Ck4ejW1u99LXKspel4by8U+42TJamY/opmSk8q20pBnzADEduTDEmA9IBgmbpfheloFO
         9L8AsNDgu+WpW+i9wZewndI5MQGHrV4u50Y0wR/2VPukD2XfMtllhhQESACMlGnQd4Q+
         RLIQ==
X-Forwarded-Encrypted: i=1; AHgh+RrEGp7jCmP+OvNQWNgrzjqm3u7uqKZv3dt02F0pDWFchfJ9nrCsC3/J6ta9E+OGESuyr9zbU0E8kHEL@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxFB/CSB7a3+gfOEZwZ6Y4o36ezxuktNQSI52+LqeW7NQz/EL5o
	NvYbmTSkUa8VWJuY6zZ7qSnL5XoruOBSHihj2lVZw9ASkCtR1Gjutdfa
X-Gm-Gg: AfdE7cl11U+kEgnyNVZ7CCqWR3Ayoa6WSA877zUetFfnCBcmBfZ+/ci8c03rm5iG1Vu
	R3cQcX5PENrpF9pHdoo+IgmoofjZgjmqfdXXUeT+eBMwJlu89YVSBfc8ap+ODBKLHofLMQY0ZX0
	16usvQmq2OcNUAfd7EbqHImAob6KAHG3m2zsE/KdyfU0YJp03hWaeMqDyIpTkoNtSr5tiubWClc
	8iTw9QghFWSTKaoCPC19a6dErSr6Kne50TaZfArJv9SjBOEwEvwy3ntAPk9Z27qlibqFFdK7DqL
	p9VR1OVena9cyX4WAhlBgVtuGivuR7fhmk4JfZj2G2AEtoiaJ0BjbMbhvH6zvKu7heBcwDMNckS
	9/TE4vCdeSPlJbWaWa9C2bWPgLKeXWSKa9b/a+r/g8DJNoaDtDclUR2MJE08u8zevtfYYWvMsNf
	uz0WEXhHe24kLYzQnk5dnexXw3ebvID1MoCyoX1g3OIczNlgoH7rjNSefkd+o/
X-Received: by 2002:a05:6000:4903:b0:47e:9d58:3b4e with SMTP id ffacd0b85a97d-47f4887f947mr2511343f8f.24.1784032458400;
        Tue, 14 Jul 2026 05:34:18 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c1f84sm8103524f8f.29.2026.07.14.05.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:34:18 -0700 (PDT)
Date: Tue, 14 Jul 2026 13:34:15 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-arch@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, linux-csky@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
 david@kernel.org, linux@armlinux.org.uk, akpm@linux-foundation.org,
 ankur.a.arora@oracle.com, rppt@kernel.org, linmag7@gmail.com,
 chleroy@kernel.org, klarasmodin@gmail.com, chenhuacai@kernel.org,
 kernel@xen0n.name, kas@kernel.org, zhangtianyang@loongson.cn,
 wangyuli@aosc.io, tsbogend@alpha.franken.de, ljs@kernel.org, jgg@ziepe.ca,
 catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
 ryan.roberts@arm.com, pasha.tatashin@soleen.com, rmclure@linux.ibm.com,
 baolin.wang@linux.alibaba.com, tj@kernel.org, kevin.brodsky@arm.com,
 anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 tglx@kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 hannes@cmpxchg.org, mhocko@kernel.org, qi.zheng@linux.dev,
 shakeel.butt@linux.dev, kasong@tencent.com, baohua@kernel.org,
 axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, vincenzo.frascino@arm.com, anshuman.khandual@arm.com,
 yang@os.amperecomputing.com, chaitanyas.prakash@arm.com, ardb@kernel.org,
 guoren@kernel.org, yang.li85200@gmail.com, viro@zeniv.linux.org.uk,
 dinguyen@kernel.org, schuster.simon@siemens-energy.com,
 wangruikang@iscas.ac.cn, junhui.liu@pigmoral.tech, muchun.song@linux.dev,
 vishal.moola@gmail.com, namcao@linutronix.de, pavel@kernel.org,
 djbw@kernel.org, yu-cheng.yu@intel.com, baolu.lu@linux.intel.com,
 Jonathan.Cameron@huawei.com, coxu@redhat.com, andreas@gaisler.com,
 liam@infradead.org, vbabka@kernel.org, surenb@google.com, mhocko@suse.com,
 geert@linux-m68k.org, shorne@gmail.com, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi
Subject: Re: [RFC PATCH 02/34] ARM: mm: make 2-level pgd_t a scalar
Message-ID: <20260714133415.78e25654@pumpkin>
In-Reply-To: <20260713135614.1618183-3-yeoreum.yun@arm.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
	<20260713135614.1618183-3-yeoreum.yun@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 13 Jul 2026 14:55:41 +0100
Yeoreum Yun <yeoreum.yun@arm.com> wrote:

> From: "David Hildenbrand (Arm)" <david@kernel.org>
> 
> We don't want pgd_t to be an array, as it prohibits returning it from a
> function, like pgdp_get().

If you use a two element structure the compiler/ABI might be able to
return that from a function in two registers.
That might make the entire mess more readable ...

	David
