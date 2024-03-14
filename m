Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E235D463
	for <linux-m68k@lists.linux-m68k.org>; Thu, 14 Mar 2024 10:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710412088; cv=none; b=NQER2ttGKgf91kQZv1il0x/sdSXoZ6AqK0/9R1pz/ot+lvnKYQrQFE4lekRS4I2vqALEXlqosIrJtO/opHZvJ2EDKcRme4pXw1UC3Kz516PWXRfMHq2fg5jUt+5k1Lt07Pq38PNKnvchDZQrJf2mWLeeGYFhtUdJ/B1aSp0RJuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710412088; c=relaxed/simple;
	bh=3AdoF7PXMMauR/QLjhj/rHqOnywAffnOLLq68/SM3B0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mRMVusmigjNVqScep/1Qz40AjrenuDy9K6efd8a7YGturGns9dJ0fR8Yit50A35p+ZFuD9P95OVuJRQmaZqFRKgaCbY1l4HGghmAZVJrmtzzfHpeMn3Iqk0VIS2/oU5rus7J9g2uS1fsaNDsknHvJnSN5UhNSXDvxMv5dksQS5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mBYADddE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mBYADddE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710412087; x=1741948087;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=3AdoF7PXMMauR/QLjhj/rHqOnywAffnOLLq68/SM3B0=;
  b=mBYADddEePEnY5jRNOwsO03FBN5yUCJw/yBlrIs540847nAEMEyFO3x2
   FdJEoa7Coac7of9Xa9JtaYOGMZU/d1F3HfIMg31P5/ayLwdMaaRvVOjrs
   Pbcbwz9To91NIh8i8CpJ+bdNjaLjhVjxaevDUM6SyF2l7u1PWkF7hiAyf
   ODAWGp08xBAqM1M3JyhQlEBGAdmdC953gjg52hjKgfURnMCVTmeqYSGvk
   4+66BiMszfzsPZ6/jIxaeMZ7R0xJU3F6fjAqUJGdu3dXPovxuyMZyCoUe
   dvdouCYhpA54u35MvLW4JS2Cm18UvkmD/bWe1gjABv9naKAPO//EI2laz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5079859"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5079859"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 03:28:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="12177178"
Received: from rboza-mobl.ger.corp.intel.com (HELO localhost) ([10.252.53.139])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 03:28:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: pgtable: Add missing #include <asm/page.h>
In-Reply-To: <8734t2xsde.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <ba359be013f379ff10f3afcea13e2f78dd9717be.1709804021.git.geert@linux-m68k.org>
 <8734t2xsde.fsf@intel.com>
Date: Thu, 14 Mar 2024 12:28:00 +0200
Message-ID: <87ttl9qf9r.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 07 Mar 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> On Thu, 07 Mar 2024, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> When just including <linux/pgtable.h>:
>>
>>     include/asm-generic/pgtable-nop4d.h:9:18: error: unknown type name =
=E2=80=98pgd_t=E2=80=99
>> 	9 | typedef struct { pgd_t pgd; } p4d_t;
>> 	  |                  ^~~~~
>>
>> Make <asm/pgtable.h> self-contained by including <asm/page.h>.
>>
>> Reported-by: Jani Nikula <jani.nikula@intel.com>
>> Closes: https://lore.kernel.org/r/878r2uxwha.fsf@intel.com
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> ---
>> Jani: Feel free to pick this up as a dependency.
>> Else I will queue this in the m68k tree for v6.10.
>
> Thanks, I'd like to pick this up as a dependency, so I can proceed with
> my series. It'll also be queued for v6.10 via the drm subsystem.

Replying here too, I've merged this via drm-misc-next as d1815393cac0
("m68k: pgtable: Add missing #include <asm/page.h>").

Thanks for the patch!

BR,
Jani.


--=20
Jani Nikula, Intel
