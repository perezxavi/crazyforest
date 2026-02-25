/*-------------------------------------------------------------------------------
 This file is part of CrazyForest.

 CrazyForest is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 CrazyForest is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with CrazyForest. If not, see <http://www.gnu.org/licenses/>.

 Written by:

 Javier Pérez-Rodríguez

 Departamento de Ciencia de la Computación e Inteligencia Artificial
 Universidad de Córdoba

 #-------------------------------------------------------------------------------*/

#include "DataSparse.h"

namespace crazyforest {

DataSparse::DataSparse(Eigen::SparseMatrix<double> &x, Rcpp::NumericMatrix &y,
                       std::vector<std::string> variable_names, size_t num_rows,
                       size_t num_cols, bool any_na)
    : x{} {
  this->x.swap(x);
  this->y = y;
  this->variable_names = variable_names;
  this->num_rows = num_rows;
  this->num_cols = num_cols;
  this->num_cols_no_snp = num_cols;
  this->any_na = any_na;
}

} // namespace crazyforest
