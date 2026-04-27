Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AE4391505
	for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Apr 2026 21:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777326295; cv=none; b=gdwHxPviR28RjGIYG1UstMa13lfzfoVWvLEaoL9AUMq4pdyhW6VI9vj5G62PFmuscLpXGQVOOBSkBV6/IvTwmZg3kGXGb3d/nssayfJ0lcNdzqeB4+aVwnge15dG6CxMcA8Yw/WLHf+ZZ4I6qvw6t/YubOJRhegiCiUDCmCQpfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777326295; c=relaxed/simple;
	bh=FyPB63wt21dCSlA1V93ZxwKVM5EVA3FyVToqQROiiGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZ2pCVlbLCzmmfB5fUFkuGiXsJNo0yavwF4ZyRgGlIc1bjV+C6pQxrG/ZLRvA1ozBb1bCrIE7jbiMLZoxobtqDk32Gi3OszoheF6cld/hUh+Ee6m93pUUylUT7FdXpV/NiUyArwlTTanTuuiCjwR5l3d9R/5AL/a52dhsOh7vVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKTpYXR2; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKTpYXR2"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2d96243c91fso17452315eec.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Apr 2026 14:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777326292; x=1777931092; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ks2Lt6yJ3ah4mtlHpB3bqT5HUFjdEUDMpMI/GdsyYSI=;
        b=QKTpYXR2uJC8UMlAUTVLIKiiVCfrBELZyOtGMJtUJfi5XIPmQFisDrdVaJnQysVwpa
         pXzi3Kh/64L3qi7rGCmoilF7nPJmgFFcNHqdxibsptB0f6nwKseqbVkuz89+zJLTNTYY
         E0jjZd831XpqlEVW1bJFA96bHOtpxeLaOpNWue0VF5vUHhHpqE66eIIhjSSXb7LHxzKC
         WE4F+IipJvwNo73KfkCz78HM94Qa9AkClfIPNMOU5oOxLjncJXIqGwjeVvCpl2n9T6yg
         wY03N1kuB89gPk+aHA3rEZwFY1W14afqDUJG+ddSD59/WazJCFBu0Od7AqdYXy2DXNx5
         8pWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326292; x=1777931092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ks2Lt6yJ3ah4mtlHpB3bqT5HUFjdEUDMpMI/GdsyYSI=;
        b=MYtLyDW0GI/c3K/5tsx/QB4d6AQBFPcOGuPU8wyZ47BFwXGS3wYcPAs5fZPRKb1adu
         dPGwbGy0iL54H8lAIfRVvxJNE9MToomrbRNNH3uUoUXPO4b3pdg1UzYfIG1Q93euxoPI
         vnqwb9aLUQKYoLjeh0ZVrrYEGrF3bQCdm5pqxEAig+h0XqX+oykoonQ7y3rk6+M2+vQ4
         +d0971Fa2BnBvExAo+wOEr3couhVS8wMrHI9l/3Rc0tbdAIaPyZuyAV84us2hB8Gb5s1
         DYaJrFIvwgL49eHi78W8n7Sipf+8Zp26oB20pGFDLt7OhNXZNL49zOWIA+u+eQlTkINS
         efBA==
X-Forwarded-Encrypted: i=1; AFNElJ+/2wDg9Hign9W1DAoS+MX8aSNfaT4KXUBkHLiwwcjRoQhR1mlSlBf/owhgqahF9nE3AAIkvMyN50yG@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Ywmh6hyIrTK53KNsKr8Aay6Ry39Nfy7aQjEqIj5yZZpUVbGyMKD
	GBiPTeeNnRpiPousleTKdEUxJKzjhcB8SO+dlhsv6eWyX5mjFDfBQQz+
X-Gm-Gg: AeBDieuiHRwRa9eLU3P7vzYMA7gywk82EdlKJC2mm8H5Hn47Ietb9TZvgCwofaNZw2T
	y4mejnD3RuqtAYqksOlHv+GGKofz39Y6E9v/C55aiHqGmgaVD+bf60377bwmk7XQfhlehkO659t
	0dgmAe2aLF4xDZjSlDrjc9758rYHfGtvGPDKbxlgoS0Xg4nXshr7zwG22jGxe1O79kcT/aS3b/r
	9cWiw2pHu4o/72bTMB28uXfSZZ1CTgcXKxE3ZRoWefv0IGswVmIGCYH93mcp89i8jJVS2yWyYYj
	tjOIngPimPf8wuN9Il29KxHtk0ESHshv9pdZQuK7Rd1j11ybY+YRzky5A7XgdnLs75vnpVRLDcs
	7Py9PSoogoX5oQ0WfFUSxcrGG7EvZlhkg1h52UsSfLkuHtdID2PAYh4KNE0Swk/I6o8kKxYzDfK
	KR8iXaiDAE1jL0o4e/qCyZAcNoMXzZS6Z2lMePu+2xQbzuiPo=
X-Received: by 2002:a05:7301:128d:b0:2e6:4d6e:2cbd with SMTP id 5a478bee46e88-2ed0a03bbbdmr354798eec.8.1777326292467;
        Mon, 27 Apr 2026 14:44:52 -0700 (PDT)
Received: from fedora ([2601:644:937c:6c90::47b5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a13f915sm649354eec.31.2026.04.27.14.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 14:44:51 -0700 (PDT)
Date: Mon, 27 Apr 2026 14:44:49 -0700
From: Vishal Moola <vishal.moola@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org,
	linux-m68k@lists.linux-m68k.org,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] mm_types: remove references to s390 gmap
Message-ID: <ae_Y0V8WsHPfQSJk@fedora>
References: <20260427105810.23761-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427105810.23761-1-pbonzini@redhat.com>

On Mon, Apr 27, 2026 at 12:58:10PM +0200, Paolo Bonzini wrote:
> s390 does not anymore use special struct page for its shadow page tables.
> The honor of giving a special meaning to pt_index is now m68k's, so
> rename the fields and adjust them for the desired type.
> 
> Cc: linux-mm@kvack.org
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: David Hildenbrand (Arm) <david@kernel.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Acked-by: Vishal Moola <vishal.moola@gmail.com>
