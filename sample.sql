select version();

CREATE TEMP TABLE temp_values (
  id serial, target_id integer, date date
);
CREATE INDEX index_temp_values_target_id ON temp_values (target_id);

INSERT INTO temp_values (target_id, date)
SELECT id, '2016-04-01'::date + (random() * generate_series(1, 100))::integer
  FROM (SELECT generate_series(1, 30000)) AS sub(id);
-- INSERT 0 3000000

VACUUM ANALYZE temp_values;

CREATE TEMP TABLE temp_targets (
  target_id integer, label text
);
INSERT INTO temp_targets(target_id, label)
select t.id, row_number() OVER(PARTITION BY t.id)::text
from (values (14933), ( 14905), ( 14931), ( 14975), ( 14888), ( 14891), ( 14894), ( 14895), ( 14892), ( 14923), ( 14887), ( 14890), ( 14935), ( 18757), ( 14964), ( 14962), ( 24524), ( 14936), ( 17858), ( 14937), ( 23071), ( 14896), ( 17856), ( 14906), ( 14918), ( 14971), ( 17020), ( 14972), ( 17025), ( 17026), ( 14977), ( 14978), ( 14897), ( 14907), ( 14919), ( 20832), ( 14953), ( 14947), ( 14955), ( 14951), ( 18452), ( 14954), ( 21373), ( 14945), ( 14949), ( 20771), ( 24556), ( 24418), ( 26738), ( 22856), ( 23542), ( 24557), ( 24419), ( 26440), ( 22857), ( 17859), ( 23543), ( 14921), ( 14976), ( 14946), ( 14952), ( 14974), ( 14909), ( 14922), ( 14966), ( 14941), ( 14903), ( 2316), ( 14938), ( 2520), ( 14934), ( 14942), ( 14939), ( 14910), ( 14924), ( 14965), ( 14963), ( 26443), ( 26441), ( 26442), ( 18462), ( 18463), ( 18464), ( 18465), ( 18470), ( 18466), ( 18467), ( 18468), ( 18469), ( 18453), ( 18454), ( 18455), ( 18456), ( 18461), ( 18457), ( 18458), ( 18459), ( 18460), ( 14898), ( 14911), ( 14925), ( 14912), ( 14926), ( 14915), ( 14929), ( 21487), ( 17018), ( 27184), ( 23753), ( 14916), ( 21488), ( 17857), ( 27185), ( 23754), ( 14930), ( 14904), ( 14917), ( 20180), ( 14932), ( 14913), ( 14927), ( 14970), ( 14959), ( 14960), ( 14902), ( 22855), ( 14899), ( 14943), ( 14944), ( 14969), ( 14968), ( 18668), ( 14950), ( 17160), ( 14914), ( 14928), ( 14948), ( 14956), ( 14958), ( 18756), ( 14957), ( 14900), ( 14901), ( 14908), ( 14920), ( 14967), ( 14889), ( 14893), ( 2313), ( 14940), ( 25908), ( 25909), ( 25912), ( 18473), ( 25910), ( 25911), ( 16898), ( 25851), ( 16899), ( 16904), ( 16900), ( 16901), ( 16902), ( 16903), ( 20772), ( 17019), ( 17021), ( 16905), ( 16906), ( 16907), ( 16908), ( 16909), ( 16910), ( 16911), ( 17022), ( 16912), ( 16913), ( 18471), ( 18472), ( 16922), ( 21374), ( 16917), ( 16914), ( 17023), ( 16915), ( 16916), ( 21375), ( 16918), ( 16919), ( 16920), ( 16921), ( 20773), ( 17024), ( 25852), ( 25853), ( 25854), ( 25855), ( 25856), ( 26739), ( 25857), ( 25858), ( 25859), ( 25875), ( 26444), ( 25879), ( 25865), ( 25864), ( 25860), ( 25861), ( 25862), ( 25863), ( 25866), ( 25867), ( 25868), ( 25869), ( 25870), ( 25871), ( 25872), ( 25873), ( 25874), ( 25876), ( 25877), ( 25878), ( 25880), ( 25881), ( 25882), ( 25883), ( 25884), ( 26740), ( 25885), ( 25886), ( 25887), ( 25903), ( 26445), ( 25907), ( 25893), ( 25892), ( 25888), ( 25889), ( 25890), ( 25891), ( 25894), ( 25895), ( 25896), ( 25897), ( 25898), ( 25899), ( 25900), ( 25901), ( 25902), ( 25904), ( 25905), ( 25906), ( 14961), ( 14933), ( 14905), ( 14931), ( 14975), ( 14888), ( 14891), ( 14894), ( 14895), ( 14892), ( 14923), ( 14887), ( 14890), ( 14935), ( 18757), ( 14964), ( 14962), ( 24524), ( 14936), ( 17858), ( 14937), ( 23071), ( 14896), ( 17856), ( 14906), ( 14918), ( 14897), ( 14907), ( 14919), ( 20832), ( 14953), ( 14947), ( 14955), ( 14951), ( 18452), ( 14954), ( 21373), ( 14945), ( 14949), ( 20771), ( 24556), ( 24418), ( 26738), ( 22856), ( 23542), ( 24557), ( 24419), ( 26440), ( 22857), ( 17859), ( 23543), ( 14921), ( 14946), ( 14952), ( 14974), ( 14909), ( 14922), ( 14966), ( 14941), ( 14903), ( 2316), ( 14938), ( 2520), ( 14934), ( 14942), ( 14939), ( 14910), ( 14924), ( 14965), ( 14963), ( 26443), ( 26441), ( 26442), ( 18462), ( 18463), ( 18464), ( 18465), ( 18470), ( 18466), ( 18467), ( 18468), ( 18469), ( 18453), ( 18454), ( 18455), ( 18456), ( 18461), ( 18457), ( 18458), ( 18459), ( 18460), ( 14898), ( 14911), ( 14925), ( 14912), ( 14926), ( 14915), ( 14929), ( 21487), ( 17018), ( 27184), ( 23753), ( 14916), ( 21488), ( 17857), ( 27185), ( 23754), ( 14930), ( 14904), ( 14917), ( 20180), ( 14932), ( 14913), ( 14927), ( 14970), ( 14959), ( 14960), ( 14902), ( 22855), ( 14899), ( 14943), ( 14944), ( 14969), ( 14968), ( 18668), ( 14950), ( 17160), ( 14914), ( 14928), ( 14948), ( 14956), ( 14958), ( 18756), ( 14957), ( 14900), ( 14901), ( 14908), ( 14920), ( 14967), ( 14889), ( 14893), ( 2313), ( 14940), ( 14961)) AS t(id);

SELECT COUNT(DISTINCT target_id)
  FROM temp_targets ;
-- 254

SELECT COUNT(DISTINCT temp_values.id)
  FROM temp_values
 WHERE temp_values.target_id IN (14933, 14905, 14931, 14975, 14888, 14891, 14894, 14895, 14892, 14923, 14887, 14890, 14935, 18757, 14964, 14962, 24524, 14936, 17858, 14937, 23071, 14896, 17856, 14906, 14918, 14971, 17020, 14972, 17025, 17026, 14977, 14978, 14897, 14907, 14919, 20832, 14953, 14947, 14955, 14951, 18452, 14954, 21373, 14945, 14949, 20771, 24556, 24418, 26738, 22856, 23542, 24557, 24419, 26440, 22857, 17859, 23543, 14921, 14976, 14946, 14952, 14974, 14909, 14922, 14966, 14941, 14903, 2316, 14938, 2520, 14934, 14942, 14939, 14910, 14924, 14965, 14963, 26443, 26441, 26442, 18462, 18463, 18464, 18465, 18470, 18466, 18467, 18468, 18469, 18453, 18454, 18455, 18456, 18461, 18457, 18458, 18459, 18460, 14898, 14911, 14925, 14912, 14926, 14915, 14929, 21487, 17018, 27184, 23753, 14916, 21488, 17857, 27185, 23754, 14930, 14904, 14917, 20180, 14932, 14913, 14927, 14970, 14959, 14960, 14902, 22855, 14899, 14943, 14944, 14969, 14968, 18668, 14950, 17160, 14914, 14928, 14948, 14956, 14958, 18756, 14957, 14900, 14901, 14908, 14920, 14967, 14889, 14893, 2313, 14940, 25908, 25909, 25912, 18473, 25910, 25911, 16898, 25851, 16899, 16904, 16900, 16901, 16902, 16903, 20772, 17019, 17021, 16905, 16906, 16907, 16908, 16909, 16910, 16911, 17022, 16912, 16913, 18471, 18472, 16922, 21374, 16917, 16914, 17023, 16915, 16916, 21375, 16918, 16919, 16920, 16921, 20773, 17024, 25852, 25853, 25854, 25855, 25856, 26739, 25857, 25858, 25859, 25875, 26444, 25879, 25865, 25864, 25860, 25861, 25862, 25863, 25866, 25867, 25868, 25869, 25870, 25871, 25872, 25873, 25874, 25876, 25877, 25878, 25880, 25881, 25882, 25883, 25884, 26740, 25885, 25886, 25887, 25903, 26445, 25907, 25893, 25892, 25888, 25889, 25890, 25891, 25894, 25895, 25896, 25897, 25898, 25899, 25900, 25901, 25902, 25904, 25905, 25906, 14961, 14933, 14905, 14931, 14975, 14888, 14891, 14894, 14895, 14892, 14923, 14887, 14890, 14935, 18757, 14964, 14962, 24524, 14936, 17858, 14937, 23071, 14896, 17856, 14906, 14918, 14897, 14907, 14919, 20832, 14953, 14947, 14955, 14951, 18452, 14954, 21373, 14945, 14949, 20771, 24556, 24418, 26738, 22856, 23542, 24557, 24419, 26440, 22857, 17859, 23543, 14921, 14946, 14952, 14974, 14909, 14922, 14966, 14941, 14903, 2316, 14938, 2520, 14934, 14942, 14939, 14910, 14924, 14965, 14963, 26443, 26441, 26442, 18462, 18463, 18464, 18465, 18470, 18466, 18467, 18468, 18469, 18453, 18454, 18455, 18456, 18461, 18457, 18458, 18459, 18460, 14898, 14911, 14925, 14912, 14926, 14915, 14929, 21487, 17018, 27184, 23753, 14916, 21488, 17857, 27185, 23754, 14930, 14904, 14917, 20180, 14932, 14913, 14927, 14970, 14959, 14960, 14902, 22855, 14899, 14943, 14944, 14969, 14968, 18668, 14950, 17160, 14914, 14928, 14948, 14956, 14958, 18756, 14957, 14900, 14901, 14908, 14920, 14967, 14889, 14893, 2313, 14940, 14961);
-- 25400

SELECT COUNT(DISTINCT temp_values.id)
  FROM temp_values
  JOIN temp_targets USING (target_id);
-- 25400

set enable_mergejoin to off;

SELECT COUNT(DISTINCT temp_values.id)
  FROM temp_values
  JOIN temp_targets USING (target_id)
 WHERE temp_values.target_id IN (14933, 14905, 14931, 14975, 14888, 14891, 14894, 14895, 14892, 14923, 14887, 14890, 14935, 18757, 14964, 14962, 24524, 14936, 17858, 14937, 23071, 14896, 17856, 14906, 14918, 14971, 17020, 14972, 17025, 17026, 14977, 14978, 14897, 14907, 14919, 20832, 14953, 14947, 14955, 14951, 18452, 14954, 21373, 14945, 14949, 20771, 24556, 24418, 26738, 22856, 23542, 24557, 24419, 26440, 22857, 17859, 23543, 14921, 14976, 14946, 14952, 14974, 14909, 14922, 14966, 14941, 14903, 2316, 14938, 2520, 14934, 14942, 14939, 14910, 14924, 14965, 14963, 26443, 26441, 26442, 18462, 18463, 18464, 18465, 18470, 18466, 18467, 18468, 18469, 18453, 18454, 18455, 18456, 18461, 18457, 18458, 18459, 18460, 14898, 14911, 14925, 14912, 14926, 14915, 14929, 21487, 17018, 27184, 23753, 14916, 21488, 17857, 27185, 23754, 14930, 14904, 14917, 20180, 14932, 14913, 14927, 14970, 14959, 14960, 14902, 22855, 14899, 14943, 14944, 14969, 14968, 18668, 14950, 17160, 14914, 14928, 14948, 14956, 14958, 18756, 14957, 14900, 14901, 14908, 14920, 14967, 14889, 14893, 2313, 14940, 25908, 25909, 25912, 18473, 25910, 25911, 16898, 25851, 16899, 16904, 16900, 16901, 16902, 16903, 20772, 17019, 17021, 16905, 16906, 16907, 16908, 16909, 16910, 16911, 17022, 16912, 16913, 18471, 18472, 16922, 21374, 16917, 16914, 17023, 16915, 16916, 21375, 16918, 16919, 16920, 16921, 20773, 17024, 25852, 25853, 25854, 25855, 25856, 26739, 25857, 25858, 25859, 25875, 26444, 25879, 25865, 25864, 25860, 25861, 25862, 25863, 25866, 25867, 25868, 25869, 25870, 25871, 25872, 25873, 25874, 25876, 25877, 25878, 25880, 25881, 25882, 25883, 25884, 26740, 25885, 25886, 25887, 25903, 26445, 25907, 25893, 25892, 25888, 25889, 25890, 25891, 25894, 25895, 25896, 25897, 25898, 25899, 25900, 25901, 25902, 25904, 25905, 25906, 14961, 14933, 14905, 14931, 14975, 14888, 14891, 14894, 14895, 14892, 14923, 14887, 14890, 14935, 18757, 14964, 14962, 24524, 14936, 17858, 14937, 23071, 14896, 17856, 14906, 14918, 14897, 14907, 14919, 20832, 14953, 14947, 14955, 14951, 18452, 14954, 21373, 14945, 14949, 20771, 24556, 24418, 26738, 22856, 23542, 24557, 24419, 26440, 22857, 17859, 23543, 14921, 14946, 14952, 14974, 14909, 14922, 14966, 14941, 14903, 2316, 14938, 2520, 14934, 14942, 14939, 14910, 14924, 14965, 14963, 26443, 26441, 26442, 18462, 18463, 18464, 18465, 18470, 18466, 18467, 18468, 18469, 18453, 18454, 18455, 18456, 18461, 18457, 18458, 18459, 18460, 14898, 14911, 14925, 14912, 14926, 14915, 14929, 21487, 17018, 27184, 23753, 14916, 21488, 17857, 27185, 23754, 14930, 14904, 14917, 20180, 14932, 14913, 14927, 14970, 14959, 14960, 14902, 22855, 14899, 14943, 14944, 14969, 14968, 18668, 14950, 17160, 14914, 14928, 14948, 14956, 14958, 18756, 14957, 14900, 14901, 14908, 14920, 14967, 14889, 14893, 2313, 14940, 14961);
-- EXPECT 25400, but RESULT 25300


