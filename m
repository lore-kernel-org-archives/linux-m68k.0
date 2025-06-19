Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965A229A0
	for <linux-m68k@vger.kernel.org>; Thu, 19 Jun 2025 00:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750292289; cv=none; b=iyVPPO9NP83L6Psse7H9KKlC//iwhcH+woTKN4XH3Vs8lS6Ee3GszeabH1xXWl1SBTyCGHy6r8bRcBYwhUCC4wNF+vGcifboy4eOc9LbDEp/7GNwyeGVoyVAwDJbrFYiPJnUrS2a5F/nr4fxvUclx9G2dMSkkKI9dF0V99WnjzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750292289; c=relaxed/simple;
	bh=sjAxAEbzDUtghp3mTExJXABH4AX1rdTHuAgNxoiVT8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ppxyK7Q5zTriGeG0S4o9OM7kN8Yc1Tzf4dO2WHHY0akdiisLbkQkX9BIGZBK4K3m4zXaEXMGRnyrl+X0irxJqrwreaOFFqP4gfOWJl0hjhndM0dhoQAzpaam6iQ5zgWVtW96G+yugJqiLi2jBw7zk42E9R5TT8qAAeFR3W1kNxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+t34tdr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+t34tdr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B441FC4CEE7;
	Thu, 19 Jun 2025 00:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750292289;
	bh=sjAxAEbzDUtghp3mTExJXABH4AX1rdTHuAgNxoiVT8w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V+t34tdrG9oBCSKBtjALxbbY7tBFUqQlWOzGeINWERuH1tsdMgBUR4aOZVI4ki4pH
	 T8NjNYCTg2BwXDTP8zGcDZWzHWRejnKZtfe4lrsesWOJfX4JexQE/jd3fSu1eFRkvc
	 ZkNWOKLvJ6VISguH7POQ2H1LfD5Q3CmH+vzBH7MJUHXw0PtK7ITN9tkRFO17purrGy
	 UsW8pieOYFrqv8S49aifX/YVjWI8JIRe2RVd3sz7q9QeCg1veuknF5dj8c8RRauBal
	 vO0MEgry88tssl7L0eu7IpiygM7LEdk67qaCnW25XoHYfo249CKVWNEv6vXc400IUV
	 IB4J8fYJ7gqWQ==
Message-ID: <a140ad5e-35c5-4d14-beb4-d55a58fe0181@kernel.org>
Date: Thu, 19 Jun 2025 10:18:04 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: Finn Thain <fthain@linux-m68k.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, port-m68k <port-m68k@netbsd.org>,
 debian-68k <debian-68k@lists.debian.org>,
 linux-m68k <linux-m68k@vger.kernel.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <022ab204-7be9-4f6a-a92f-2601fae1f146@vivier.eu>
 <5d8619dfe4134319b558684209f2b89c5c1447cf.camel@physik.fu-berlin.de>
 <889f54af-2317-ee51-cea5-47d813683944@linux-m68k.org>
 <5de0835e46f8c2479668fe5fe98f8e0d230cbfce.camel@physik.fu-berlin.de>
 <d3c2060c-f2ea-f80d-2462-d3dba29950c2@linux-m68k.org>
 <0b09dcea10c9bab4a50b2599ef8ac59b89f09b3e.camel@physik.fu-berlin.de>
 <8eb87c55-95c2-0c73-4941-6e8732266220@linux-m68k.org>
 <4c0581c5baccf73e96e53d755e70b57b23ba1da4.camel@physik.fu-berlin.de>
 <CAMuHMdWdDdoO9w9PvULL6+vVZs1Fn1boobgV9fO9OqpyhOsznQ@mail.gmail.com>
 <cebbe80cb85e004176ae2b566132d6d8e92e73db.camel@physik.fu-berlin.de>
 <CAMuHMdVuU1bsoUwXNkuUvxjb-F-YS325dEX+KPtY4FJPbtMUXw@mail.gmail.com>
 <29677f1e81b42c87926875109907485e41587883.camel@physik.fu-berlin.de>
 <38c670cc-6169-4720-a883-c34df26e1a4f@kernel.org>
 <fc9dd771-b010-e593-d8e4-2cdad57722ed@linux-m68k.org>
Content-Language: en-US
From: Greg Ungerer <gerg@kernel.org>
In-Reply-To: <fc9dd771-b010-e593-d8e4-2cdad57722ed@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 19/6/25 08:29, Finn Thain wrote:
> 
> On Wed, 18 Jun 2025, Greg Ungerer wrote:
> 
>>
>>> It's not really necessary to enforce this on Coldfire. However, since
>>> buildroot builds completely from source, it wouldn't even be a problem
>>> to change the alignment there as well.
>>
>> Yes, that is totally right in my experience. Certainly in my ColdFire
>> work it is pretty much always a build-everything approach via buildroot
>> or similar. I wouldn't think an ABI change would actually worry too many
>> ColdFire uses, they don't use distributions like debian on them. (I
>> would love to hear from anyone who does!).
>>
> 
> That may work for end-users with a vendor BSP. But upstream developers
> need to be able to swap components. In general, when debugging I often
> have to run old binaries to find out whether I'm dealing with a deeper
> regression or not. Also, there is the bisection problem. It's not just a
> couple of distros who get to pay for an ABI break. It's the entire
> ecosystem.

I am sure there is value in that for some. Like I said though
that has not been my experience with ColdFire. And by that I mean as
the upstream maintainer of ColdFire Linux support for +20 years.
I pretty mush _always_ build kernel + libs + user for testing even
small kernel changes. My standard small system build takes less
than 1 minute for everything. Again, I am just relating my experience
with this - admittedly probably not typical of actual end users.

FWIW even when I was working on shipping ColdFire based products
my firmware was always a complete update, no separate kernel and
user space updates. Typical of small embedded systems. I can't
actually remember many times I have run with a previously compiled
user space.

Regards
Greg


