Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37673E5583
	for <linux-m68k@lists.linux-m68k.org>; Thu, 14 May 2026 13:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766829; cv=none; b=MeMLZ8gTR4UjVUspWSJZUKnk6PAlKjJF0BS0A/Vuw/aRT41fPUzSQIjHs4/Y9mruzufFFbrr+BVDZsaliTF8k8CzkNP9LLyurqvxVxSf4ViWOGsp5ZqdfK7bNoAbLFP1j+iQ+H8N5UkI36vlgA1RGt3GXFqarhhZvMvYzb2JDEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766829; c=relaxed/simple;
	bh=csuW3myMDRTwfSkVr/fGJ+LdsWf9iBuZuAecKJ3RvRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irNWSQ0f39bw/Fct5UZyFYeH0YW70quMaPz0L5mH8+JMdSKgYmDvcQJuleY1iEfREafs7qcnpr8sVusfqiWnEFYM+1DzNgXp3jSD+JbDsHuyNcg1quclfVewavpMl3sM/FF9yUSKelaH+tSBGrkaGQGXpZ3fcg5cx9cNgX9JwB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=EjBplXYt; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="EjBplXYt"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-90d13fa59e8so337239985a.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 14 May 2026 06:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1778766827; x=1779371627; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P+SudBIcbJEYVdXIJisNlY3md8aZgEue8Fntr+vI0eA=;
        b=EjBplXYtI9rwkSvRBbAjk1yXuUsjAYLx2byfJLIb66fOwmSL5vVngd5Y4ZA2uW1u1b
         Ax81Z371m6U7+uKeg76qr3qgBd2P18kpqM1QZF4mh1uP8bcBW04In4wLmrcZ90ZbdnYw
         VRfdHMWmJ7zAVUPMWYGCYvfRmIjZhBB6EKfagU4+6BDZxVfZwkunA6R42d4R7mq/Lf0G
         w5DCnD4XyYHb0nSPFvcUu20NeuuA/N5eULD+60n9zcRK2iwNAUopEgyusgvN+8GB10Ix
         SIzWxK4GjaYAfLmJkBbn/a6uonfS1x5s13zuflEI3zn9l++gXeX9zCowpLXCvy24TRbi
         q49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766827; x=1779371627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+SudBIcbJEYVdXIJisNlY3md8aZgEue8Fntr+vI0eA=;
        b=Wi52v11yRtT+QSGPYRuvnsjIJ+kleJkPE3fEKJfyAqGOnsxgKcQwk3yIW30yobAGOL
         Bd+JFzXUe7CiJFA4cBl0KOjF+PGt1nh+D1ojclpG1AbqEvczNbmAPtSw2N0U7Z3yHW7d
         KHtaYS6MLeZRvCX9aqGBddQUOAYL9r+t4uueWt6w1QjLpVuCDdfKIGEByq65IdSE++Oz
         nfbPJtO8SKbBV3BHg9lWlLTl6fEwbJTPn/IEESPH05gDmqXUGYT8SRCuF/wpYDoHSQk2
         HbxMwozG6KVAN0TbWKJu/VX59hRqsh7e6Q6Qgry4/UTxh0vXq1e84UKdf1WlXIqdg2eX
         EFDg==
X-Forwarded-Encrypted: i=1; AFNElJ/Eoc9jdR9yzt008jcJ/nde6YbHRDTS6CHZYYk0D4usmU/R5j+e+AAiGkusKo1zXzu4lDXJ5ma01xwe@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy03WD8nsCVnTy5NP8IeYyUgJyUG0nEYaMKbRtVwq6vvopViTFN
	IAf4g8jZcoz1j5fLOlkJhesNaz/tmplSxZ1t7YZnGSiNaade6XPdFUnkEeodGB0R6bI=
X-Gm-Gg: Acq92OHDgX2zNuv5/4IBV7LKb7Aj2OXCEEd/6cs6r4ZxZBlRJlRJ+w6KVvOOASwoS08
	LN1xewFdQbJ8VgNChDx28qoP0CiMNjSq6zE/0CsLr4S8mDP7b80E81HDap6qZiFPhYUtCLyyzkA
	FkhBH523oKck+EIhvZKl+hAB3Wu3XlEo+HbWbFLbwHHRQu3S/vM3pi9RS38lF7pzZd4DRFBNsOf
	YL+wgfoRsFF9CHA2sw6NyTZCBYCQaf23CfwQMjTAopxyFxToPoS4fls+aj/dsUrlqUcqYJZ6OcB
	p/14HuE2/UTWtrTJG7AtLNRwXnfFAA+LEL1myBxY8/jH6TZhlyfw6x+XIkItjM4Db2PAFvhTGtv
	hA9H7ZpfmWN6ctaHUBe86/4v8CaHuBvCrkT1f6XYL9G3s8olkn69wR5WdXsCcCr/xacCfP85s4G
	EziUy8qV8GRvFPk1Y4BLDA8fcq9lLAjx95F6REmHAXMUAiv7bB44VqJN0fWTzCTac7BNeM3F5/+
	lvphUqFHh8h
X-Received: by 2002:a05:620a:7283:b0:90f:d004:5480 with SMTP id af79cd13be357-90fd0045772mr809098685a.6.1778766826553;
        Thu, 14 May 2026 06:53:46 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-100-36-248-188.washdc.fios.verizon.net. [100.36.248.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910ba9454basm253697485a.12.2026.05.14.06.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:53:46 -0700 (PDT)
Date: Thu, 14 May 2026 09:53:42 -0400
From: Gregory Price <gourry@gourry.net>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Harry Yoo <harry.yoo@oracle.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
	virtualization@lists.linux.dev, linux-mm@kvack.org,
	Andrea Arcangeli <aarcange@redhat.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-alpha@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v7 11/31] mm: remove arch vma_alloc_zeroed_movable_folio
 overrides
Message-ID: <agXT5s4FLL54MS-e@gourry-fedora-PF4VCD3F>
References: <cover.1778616612.git.mst@redhat.com>
 <7d637bcac4bb5705388136a75f0fdfe2881e5f20.1778616612.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d637bcac4bb5705388136a75f0fdfe2881e5f20.1778616612.git.mst@redhat.com>

On Tue, May 12, 2026 at 05:06:04PM -0400, Michael S. Tsirkin wrote:
> Now that the generic vma_alloc_zeroed_movable_folio() uses
> __GFP_ZERO, the arch-specific macros on alpha, m68k, s390, and
> x86 that did the same thing are redundant.  Remove them.
> 
> arm64 is not affected: it has a real function override that
> handles MTE tag zeroing, not just __GFP_ZERO.
> 
> Suggested-by: David Hildenbrand <david@kernel.org>
> Acked-by: Magnus Lindholm <linmag7@gmail.com>
> Acked-by: Greg Ungerer <gerg@linux-m68k.org>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Reviewed-by: Gregory Price <gourry@gourry.net>

