From: Steven King <sfking@fdwdc.com>
Subject: Re: [PATCH 00/22] m68knommu: simplify ColdFire GPIO
	init code
Date: Thu, 26 Apr 2012 00:28:47 -0700
Message-ID: <201204260028.47328.sfking@fdwdc.com>
References: <1335399962-10308-1-git-send-email-gerg@snapgear.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <1335399962-10308-1-git-send-email-gerg@snapgear.com>
Content-Disposition: inline
List-Unsubscribe: <http://mailman.uclinux.org/mailman/options/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Errors-To: uclinux-dev-bounces@uclinux.org
Sender: uclinux-dev-bounces@uclinux.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
List-Id: linux-m68k@vger.kernel.org

On Wednesday 25 April 2012 5:25:40 pm gerg@snapgear.com wrote:
> The GPIO init code for the ColdFire cores is a set of very large tables,
> one for each ColdFire SoC type. Each SoC type has very different GPIO pin
> arrangements, so one for each is unavoidable. But there is fundamentaly
> two types of setup/access that we are trying to support.
>
> With some pre-processor macro magic we can reduce the tables significantly,
> making them easier to read, easier to get correct, and easier to maintain.
>
> The following patches implement a set of simplifying changes. What do
> others think?  Overall we remove close to 2000 lines of code, and the end
> tables are much easier to read and get correct.
>

Hi Greg,

This looks fine to me.
You can add my Acked-by: Steven King <sfking@fdwdc.com>
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
