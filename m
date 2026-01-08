Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D281277023
	for <linux-m68k@lists.linux-m68k.org>; Thu,  8 Jan 2026 02:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767840996; cv=none; b=QWpYLHbM9/FNCCqhmui4EmEU9RAsw0WHfHdgE8vIMy1MO4vnYD9Ce9V2QuaaZuCD387uBFrY6FUUFtPHA42Vx4EMIY06X8LYjKQr5UuAfYvIfj7v222Q3V/g1Fa12nsHZfSkg6HY20ZW4+49xvK8ZGH+Xh8gA0EfZ6S024bXzTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767840996; c=relaxed/simple;
	bh=bb09VXEHSGVuDvACYJHsjuF/qKdFpVlUXhZlI58yIwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ium39sQXra8QOvqdaYTQitcd11hTFfq+hOV6Wg95ImQPjC60gJnqcAmnYiObMYpLq8lnBB9Sp4zwMpXlWIN2E4yyddieCNh315mfTj/iJmIEDrwXkzBtWjXmAdTFY8sMyhVtw95EevrSgfh/hE5Zdcuz03UC4zqOxeFl9mskjrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VO9+Hp/X; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VO9+Hp/X"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8034D6000A;
	Thu,  8 Jan 2026 02:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97908C4CEF1;
	Thu,  8 Jan 2026 02:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767840993;
	bh=bb09VXEHSGVuDvACYJHsjuF/qKdFpVlUXhZlI58yIwU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VO9+Hp/XVRs8XQB3IDBstup2R+DaU4I6K4mDp34Wm113uMcakMBKaj2eTx55ExHtE
	 nBWUzkdaWvlhDxELVvEA3C6puD6nUZG5J+gpcQ61WkLHnhj+M05LSE5AZcHJamwhvc
	 j/BMfPrbYmdBOqJI5BeEugABP3Mc/vfHCk9GLrpJscoyfLAOJwB+2t8XFPTPsEybag
	 xGnWNL183qpjfSIH8SOBIaB8sVnhazL4Rw/1WNvWFQdpTNcIdnvnpj/0Brkneg1BPR
	 7qMuhdE1AoXtCk2F775jaiAkT9nh2gM4h7JiM3GPN+qLCo8vxQs/u1WGbxiPYaxbeg
	 hV7kgr+lj43kw==
Message-ID: <dc57f648-524c-4fdc-9fce-73f1bab2fee4@kernel.org>
Date: Wed, 7 Jan 2026 18:56:29 -0800
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/28] arc: introduce arch_zone_limits_init()
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>,
 Brian Cain <bcain@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Corbet <corbet@lwn.net>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Stafford Horne <shorne@gmail.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, x86@kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org
References: <20260102070005.65328-1-rppt@kernel.org>
 <20260102070005.65328-3-rppt@kernel.org>
Content-Language: en-US
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <20260102070005.65328-3-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/1/26 22:59, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Move calculations of zone limits to a dedicated arch_zone_limits_init()
> function.
>
> Later MM core will use this function as an architecture specific callback
> during nodes and zones initialization and thus there won't be a need to
> call free_area_init() from every architecture.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Thx !

Acked-by: Vineet Gupta <vgupta@kernel.org>
